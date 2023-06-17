import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/topup_viewmodel.dart';

class WithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopUpViewModel(),
      child: const MaterialApp(
        home: WithdrawPage2(),
      ),
    );
  }
}

class WithdrawPage2 extends StatefulWidget {
  const WithdrawPage2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage2>
    with SingleTickerProviderStateMixin {
  TextEditingController amountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool termsChecked = false;

  void _performWithdraw() {
    String amount = amountController.text;
    double withdrawAmount = double.tryParse(amount) ?? 0.0;

    if (withdrawAmount > 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Withdraw Success'),
            content:
                Text('Your balance has been successfully withdrawn: $amount'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // Update the balance in the ViewModel
      final topUpViewModel =
          Provider.of<TopUpViewModel>(context, listen: false);
      topUpViewModel.updateSaldo(withdrawAmount as int);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Withdraw Failed'),
            content:
                const Text('Please check the amount and terms and conditions.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildBalanceWidget() {
    return Consumer<TopUpViewModel>(
      builder: (context, topupViewModel, _) {
        int? saldo = topupViewModel.currentUser?.saldo;

        final currencyFormat =
            NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
        final formattedSaldo = currencyFormat.format(saldo ?? 0);

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Saldo',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                formattedSaldo,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWithdrawMethodsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 1.5,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        _buildWithdrawMethodIcon(
          'Bank Account 1',
          Icons.account_balance_wallet,
        ),
        _buildWithdrawMethodIcon(
          'Bank Account 2',
          Icons.account_balance_wallet,
        ),
        _buildWithdrawMethodIcon(
          'Bank Account 3',
          Icons.account_balance_wallet,
        ),
        _buildWithdrawMethodIcon(
          'Bank Account 4',
          Icons.account_balance,
        ),
      ],
    );
  }

  Widget _buildWithdrawMethodIcon(String methodName, IconData iconData) {
    return InkWell(
      onTap: () {
        _showWithdrawAmountInput(methodName);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(128, 128, 128, 0.5),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(height: 8.0),
            Text(
              methodName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }

  void _showWithdrawAmountInput(String methodName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Withdraw Amount'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Virtual Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: termsChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        termsChecked = value ?? false;
                      });
                    },
                  ),
                  Text('Saya menyetujui syarat dan ketentuan.'),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _performWithdraw();
                },
                child: Text('Withdraw'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopUpViewModel>(
      create: (_) => TopUpViewModel(),
      child: Builder(
        builder: (context) {
          final topupViewModel = Provider.of<TopUpViewModel>(context);

          return FutureBuilder(
            future: Future.wait([topupViewModel.getCurrentUser()]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final currentUser = topupViewModel.currentUser;

                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Withdraw'),
                    backgroundColor: Color(0xFF005555),
                  ),
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildBalanceWidget(),
                            const SizedBox(height: 16.0),
                            const Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Select Withdraw Method',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: _buildWithdrawMethodsGrid(),
                            ),
                          ],
                        ),
                      ),
                      const Navigasi(),
                      const NavigasiMid(),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
