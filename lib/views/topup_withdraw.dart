import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool termsChecked = false;

  double saldo = 1000.0;

  void _performWithdraw() {
    String amount = amountController.text;
    double withdrawAmount = double.tryParse(amount) ?? 0.0;

    if (withdrawAmount > 0 && termsChecked) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Withdraw Success'),
            content:
                Text('Your balance has been successfully withdrawn : $amount'),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Withdraw Failed'),
            content: Text('Please check the amount and terms and conditions.'),
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
    }
  }

  Widget _buildBalanceWidget() {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    final formattedSaldo = currencyFormat.format(saldo);

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
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
          SizedBox(height: 8.0),
          Text(
            formattedSaldo,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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
            color: Color.fromRGBO(128, 128, 128, 0.5),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            SizedBox(height: 8.0),
            Text(
              methodName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
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
          title: Text('Withdraw Amount'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Virtual Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'),
        backgroundColor: Color(0xFF005555),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildBalanceWidget(),
                SizedBox(height: 16.0),
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
          Navigasi(),
          NavigasiMid(),
        ],
      ),
    );
  }
}
