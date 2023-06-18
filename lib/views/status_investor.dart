import 'package:flutter/material.dart';
import 'package:homepage/views/history_investor.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/investasi_investor_viewmodel.dart';

class StatusInvestor extends StatefulWidget {
  const StatusInvestor({Key? key}) : super(key: key);

  @override
  _StatusInvestorState createState() => _StatusInvestorState();
}

class _StatusInvestorState extends State<StatusInvestor>
    with SingleTickerProviderStateMixin {
  String _estDidapatkan = "null";
  String _totalDanaDiberikan = "null";
  String _totalEstimasi = "null";

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
                  List<dynamic> mergedList = investasiViewModel.mergedList;

                  int count = mergedList.length;

                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Status Investasi",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              //pergi ke halaman akun
                                              builder: (context) =>
                                                  HistoryInvestor(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.history,
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        margin: EdgeInsets.only(bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Color(0xff069A8E),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(
                                                "Ringkasan Investasi yang Berjalan",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  // color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              // Garis horizontal
                                              color: Colors.black,
                                              thickness: 1,
                                              // indent: 10,
                                              // endIndent: 10,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              height: 50,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    child: Icon(
                                                      Icons
                                                          .assignment_turned_in_outlined,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Total Investasi yang Sedang Berjalan"),
                                                      Text(
                                                        '$count',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              height: 50,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    child: Icon(
                                                      Icons
                                                          .request_quote_outlined,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Jumlah Dana yang Diberikan"),
                                                      Text(
                                                        investasiViewModel
                                                            .jumlahDanaDiberikan
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              height: 50,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    child: Icon(
                                                      Icons.stacked_line_chart,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Estimasi Hasil"),
                                                      Text(
                                                        investasiViewModel
                                                            .estimasiHasil
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: mergedList.length,
                                          itemBuilder: (context, index) {
                                            Map<String, dynamic> data =
                                                mergedList[index];

                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Color(0xffA1E3D8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
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
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
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
                                                      Text(
                                                          "Dana yang diberikan"),
                                                      Text(
                                                        '${data['dana_diberikan']}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
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
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      )),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff069A8E),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    left: 5),
                                                            child: Text(
                                                              "Status",
                                                            )),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
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
