import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  List<Transaction> transactions = [
    Transaction('Top Up', '2023-06-01', 'Rp 500,000'),
    Transaction('Withdraw', '2023-05-28', 'Rp 300,000'),
    Transaction('Top Up', '2023-05-25', 'Rp 200,000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Riwayat Transaksi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    Transaction transaction = transactions[index];
                    return ListTile(
                      title: Text(transaction.type),
                      subtitle: Text(transaction.date),
                      trailing: Text(transaction.amount),
                    );
                  },
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
}

class Transaction {
  final String type;
  final String date;
  final String amount;

  Transaction(this.type, this.date, this.amount);
}