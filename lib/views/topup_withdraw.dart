import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

enum WithdrawMethod {
  Dana,
  Ovo,
  Gopay,
  BankAccount,
}

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  WithdrawMethod selectedMethod = WithdrawMethod.Dana;

  void _performWithdraw() {
    String amount = amountController.text;
    double withdrawAmount = double.tryParse(amount) ?? 0.0;

    if (withdrawAmount > 0) {
      String accountNumber = accountNumberController.text;

      if (selectedMethod == WithdrawMethod.BankAccount &&
          accountNumber.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Account Number'),
              content: Text('Please enter a valid account number'),
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
        // Lakukan tindakan withdraw sesuai dengan kebutuhan aplikasi Anda
        // Misalnya, mengirim permintaan ke server atau mengurangi saldo pengguna
        // ...

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Withdraw Success'),
              content: Text('You have successfully withdrawn $amount'),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Amount'),
            content: Text('Please enter a valid amount'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Withdraw Amount',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select Withdraw Method'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.account_balance_wallet),
                                title: Text('Dana'),
                                onTap: () {
                                  setState(() {
                                    selectedMethod = WithdrawMethod.Dana;
                                  });
                                  Navigator.pop(context);
                                  _showAccountNumberInput();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.account_balance_wallet),
                                title: Text('OVO'),
                                onTap: () {
                                  setState(() {
                                    selectedMethod = WithdrawMethod.Ovo;
                                  });
                                  Navigator.pop(context);
                                  _showAccountNumberInput();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.account_balance_wallet),
                                title: Text('GoPay'),
                                onTap: () {
                                  setState(() {
                                    selectedMethod = WithdrawMethod.Gopay;
                                  });
                                  Navigator.pop(context);
                                  _showAccountNumberInput();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.account_balance),
                                title: Text('Bank Account'),
                                onTap: () {
                                  setState(() {
                                    selectedMethod = WithdrawMethod.BankAccount;
                                  });
                                  Navigator.pop(context);
                                  _showAccountNumberInput();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text('Withdraw'),
                ),
              ),
            ],
          ),
          const Navigasi(),
          const NavigasiMid(),
        ],
      ),
    );
  }

  void _showAccountNumberInput() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Account Number'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
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
}
