import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/riwayat_topup_viewmodel.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RiwayatTopUpViewModel>(
      create: (_) => RiwayatTopUpViewModel(),
      child: const MaterialApp(
        title: 'Riwayat',
        home: RiwayatPage2(),
      ),
    );
  }
}

class RiwayatPage2 extends StatelessWidget {
  const RiwayatPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Color(0xFF005555),
      ),
      body: Stack(
        children: [
          Consumer<RiwayatTopUpViewModel>(
            builder: (context, viewModel, _) {
              // Access the viewmodel and call the getRiwayatTopUp method
              viewModel.getRiwayatTopUp();

              // Use the data from the viewmodel to display the transactions
              List<Transaction> transactions = viewModel.transactions;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        Transaction transaction = transactions[index];
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: ListTile(
                            title: Text(transaction.jenis),
                            subtitle: Text(transaction.date),
                            trailing: Text(transaction.amount),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const Navigasi(),
          const NavigasiMid(),
        ],
      ),
    );
  }
}
