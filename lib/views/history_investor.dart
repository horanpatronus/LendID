import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:provider/provider.dart';

import '../viewmodels/investasi_investor_viewmodel.dart';

class HistoryInvestor extends StatelessWidget {
  const HistoryInvestor({super.key});
  final String _namaProyek = "Nama Proyek";
  final String _deskripsiProyek =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  final String _danaDiberikan = "Rp2.000.000,-";

  final String _estDidapatkan = "Rp100.000,-";
  final String _tglHasil = "5 Maret 2023";

  final String _statusSelesai = "Selesai";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InvestasiInvestorViewModel>(
        create: (_) => InvestasiInvestorViewModel(),
        child: Builder(builder: (context) {
          final investasiViewModel =
              Provider.of<InvestasiInvestorViewModel>(context);

          return FutureBuilder(
              future: Future.wait<void>(
                  [investasiViewModel.getInvestasiInvestor()]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<dynamic> mergedListSelesai =
                      investasiViewModel.mergedListSelesai;

                  int count = mergedListSelesai.length;

                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Stack(
                        children: [
                          Container(
                            // color: Colors.greenAccent,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(
                                              context,
                                              MaterialPageRoute(
                                                //pergi ke halaman akun
                                                builder: (context) =>
                                                    StatusInvestor(),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.arrow_back)),
                                      Container(
                                        width: 10,
                                      ),
                                      Text(
                                        "Riwayat Investasi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: mergedListSelesai.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          mergedListSelesai[index];
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xffA1E3D8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  5), // Mengatur posisi bayangan (x, y)
                                            ),
                                          ],
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Image(
                                                      image: NetworkImage(
                                                        "https://picsum.photos/id/1023/100/100",
                                                      ),
                                                      fit: BoxFit.cover,
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${data['nama_pinjaman']}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          '${data['deskripsi_proyek']}',
                                                          // style: TextStyle(fontSize: 10),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.justify,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Dana yang diberikan"),
                                                Text(
                                                  '${data['dana_diberikan']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                            Container(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "Est. hasil yang didapatkan"),
                                                Text(
                                                  '${data['estimasi_hasil']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "Tgl. mendapatkan hasil"),
                                                    Text(
                                                      '${data['estimasi_tanggal']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                color: Color(0xff069A8E),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 5, left: 5),
                                                      child: Text(
                                                        "Status",
                                                      )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20),
                                                    child: Center(
                                                      child: Text(
                                                        '${data['status']}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          Navigasi(),
                          NavigasiMid(),
                        ],
                      ),
                    ),
                  );
                }
              });
        }));
  }
}
