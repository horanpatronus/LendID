import 'package:flutter/material.dart';

class StatusUMKMAccepted extends StatefulWidget {
  const StatusUMKMAccepted({Key? key}) : super(key: key);
  @override
  StatusUMKMAcceptedState createState() {
    return StatusUMKMAcceptedState();
  }
}

class StatusUMKMAcceptedState extends State<StatusUMKMAccepted> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Status UMKM - Accepted Page',
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Status Peminjaman'),
                  bottom: const TabBar(
                      tabs: [Tab(text: "Diterima"), Tab(text: "Proses")]),
                ),
                backgroundColor: Color(0xfff5f5f5),
                body: TabBarView(children: [
                  Center(
                    child: Center(
                      child: Column(
                        children: [
                          // container judul
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 30, bottom: 10),
                            child: const Text(
                              'Status Peminjaman',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff005555),
                                  fontSize: 20),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          // container button

                          // container utama
                          Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 0.5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Ringkasan Peminjaman Berjalan',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff005555),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00000),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total Peminjaman Berjalan',
                                                style: TextStyle(
                                                  color: Color(0xff005555),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                '5 Peminjaman',
                                                style: TextStyle(
                                                    color: Color(0xff0055555),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00000),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jumlah Dana yang Dipinjam',
                                                style: TextStyle(
                                                  color: Color(0xff005555),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Rp10.000.000,00',
                                                style: TextStyle(
                                                    color: Color(0xff0055555),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00000),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jumlah Utang Terbayar',
                                                style: TextStyle(
                                                  color: Color(0xff005555),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Rp1.000.000,00',
                                                style: TextStyle(
                                                    color: Color(0xff0055555),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00000),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sisa Utang',
                                                style: TextStyle(
                                                  color: Color(0xff005555),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Rp2.650.000,00',
                                                style: TextStyle(
                                                    color: Color(0xff0055555),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),

                          // --- ini harusnya pake listview builder --- //
                          Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 0.5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00000),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Proyek Proyekan',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff005555),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff0055555),
                                                ),
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.clip,
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Sisa Utang: Rp2.650.000,00',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Dana yang Pinjaman'),
                                            Text('Rp3.000.000,00',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Bunga yang Dikenai'),
                                            Text('Rp180.000,00 (6%)',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Total Utang'),
                                            Text('Rp3.180.000,00',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Progress Cicilan'),
                                            Text('1 dari 6 kali',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Tanggal Peminjaman'),
                                            Text('5 Januari 2023',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Tanggal Pelunasan'),
                                            Text('5 Januari 2024',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Sisa Waktu'),
                                            Text('11 bulan',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 50,
                                              color: Color(0xfff5f5f5),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color(
                                                          0xff005555), // Background color
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text('Lihat Detail'),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                              height: 50,
                                              color: Color(0xfff5f5f5),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color(
                                                          0xff005555), // Background color
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text('Bayar Utang'),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Center(
                      child: Text("Isi Tab 2"),
                    ),
                  )
                ])

                //   body: SingleChildScrollView(
                //     child: Column(
                //       children: [

                //         // container judul
                //         Container(
                //           padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                //           child: const Text(
                //             'Status Peminjaman',
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Color(0xff005555),
                //               fontSize: 20
                //             ),),
                //         ),

                //         SizedBox(height: 10,),
                //         // container button

                //         // container utama
                //         Container(
                //           padding: const EdgeInsets.all(20),
                //           decoration: BoxDecoration(
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.grey.withOpacity(0.1),
                //                 spreadRadius: 0.5,
                //                 blurRadius: 10,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                //             ],
                //           ),
                //           child: Container(
                //             padding: const EdgeInsets.all(30),
                //             decoration: const BoxDecoration(
                //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //               color: Color(0xffffffff),
                //             ),
                //             child: Column(
                //               children: <Widget>[
                //                 Text('Ringkasan Peminjaman Berjalan',
                //                   style: TextStyle(
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.bold,
                //                     color: Color(0xff005555),
                //                     ),
                //                     textAlign: TextAlign.left,),

                //                 SizedBox(height: 10,),

                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [

                //                     Container(
                //                       height: 30,
                //                       width: 30,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0xff00000),
                //                       ),
                //                     ),
                //                     SizedBox(width: 5,),

                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Total Peminjaman Berjalan',
                //                             style: TextStyle(color: Color(0xff005555),),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                           Text(
                //                             '5 Peminjaman',
                //                             style: TextStyle(
                //                               color: Color(0xff0055555),
                //                               fontWeight: FontWeight.bold
                //                               ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),

                //                 SizedBox(height: 10,),

                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [

                //                     Container(
                //                       height: 30,
                //                       width: 30,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0xff00000),
                //                       ),
                //                     ),
                //                     SizedBox(width: 5,),

                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Jumlah Dana yang Dipinjam',
                //                             style: TextStyle(color: Color(0xff005555),),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                           Text(
                //                             'Rp10.000.000,00',
                //                             style: TextStyle(
                //                               color: Color(0xff0055555),
                //                               fontWeight: FontWeight.bold
                //                               ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 10,),

                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [

                //                     Container(
                //                       height: 30,
                //                       width: 30,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0xff00000),
                //                       ),
                //                     ),
                //                     SizedBox(width: 5,),

                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Jumlah Utang Terbayar',
                //                             style: TextStyle(color: Color(0xff005555),),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                           Text(
                //                             'Rp1.000.000,00',
                //                             style: TextStyle(
                //                               color: Color(0xff0055555),
                //                               fontWeight: FontWeight.bold
                //                               ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 10,),

                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [

                //                     Container(
                //                       height: 30,
                //                       width: 30,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0xff00000),
                //                       ),
                //                     ),
                //                     SizedBox(width: 5,),

                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Sisa Utang',
                //                             style: TextStyle(color: Color(0xff005555),),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                           Text(
                //                             'Rp2.650.000,00',
                //                             style: TextStyle(
                //                               color: Color(0xff0055555),
                //                               fontWeight: FontWeight.bold
                //                               ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),

                //               ],
                //             ),
                //           )
                //           ),

                //         // --- ini harusnya pake listview builder --- //
                //         Container(
                //           padding: const EdgeInsets.all(20),
                //           decoration: BoxDecoration(
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.grey.withOpacity(0.1),
                //                 spreadRadius: 0.5,
                //                 blurRadius: 10,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                //             ],
                //           ),
                //           child: Container(
                //             padding: const EdgeInsets.all(30),
                //             decoration: const BoxDecoration(
                //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //               color: Color(0xffffffff),
                //             ),
                //             child: Column(
                //               children: <Widget>[
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [

                //                     Container(
                //                       height: 50,
                //                       width: 50,
                //                       decoration: const BoxDecoration(
                //                         color: Color(0xff00000),
                //                       ),
                //                     ),
                //                     SizedBox(width: 5,),
                //                     Expanded(
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'Proyek Proyekan',
                //                             style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff005555),),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                           Text(
                //                             'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.',
                //                             style: TextStyle(fontSize: 12, color: Color(0xff0055555),),
                //                             textAlign: TextAlign.justify,
                //                             overflow: TextOverflow.clip,
                //                             maxLines: 3,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),

                //                 SizedBox(height: 15, ),

                //                 Text('Sisa Utang: Rp2.650.000,00', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),),

                //                 SizedBox(height: 10,
                //                   child: Divider(color: Colors.black,),),

                //                   Column(
                //                   children: [
                //                     SizedBox(
                //                       height: 10,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Dana yang Pinjaman'),
                //                         Text('Rp3.000.000,00', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Bunga yang Dikenai'),
                //                         Text('Rp180.000,00 (6%)', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Total Utang'),
                //                         Text('Rp3.180.000,00', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Progress Cicilan'),
                //                         Text('1 dari 6 kali', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Tanggal Peminjaman'),
                //                         Text('5 Januari 2023', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Tanggal Pelunasan'),
                //                         Text('5 Januari 2024', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 5,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text('Sisa Waktu'),
                //                         Text('11 bulan', style: TextStyle(fontWeight: FontWeight.bold)),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 15,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Container(
                //                           height: 50,
                //                           color: Color(0xfff5f5f5),
                //                           child: Padding(
                //                             padding: const EdgeInsets.all(0),
                //                             child: ElevatedButton(
                //                               onPressed: () {},
                //                               style: ElevatedButton.styleFrom(
                //                                 primary: Color(0xff005555), // Background color
                //                               ),
                //                               child: Row(
                //                                 mainAxisAlignment: MainAxisAlignment.center,
                //                                 children: [
                //                                   Text('Lihat Detail'),
                //                                 ],
                //                               ),
                //                             )
                //                           ),
                //                         ),
                //                         Container(
                //                           height: 50,
                //                           color: Color(0xfff5f5f5),
                //                           child: Padding(
                //                             padding: const EdgeInsets.all(0),
                //                             child: ElevatedButton(
                //                               onPressed: () {},
                //                               style: ElevatedButton.styleFrom(
                //                                 primary: Color(0xff005555), // Background color
                //                               ),
                //                               child: Row(
                //                                 mainAxisAlignment: MainAxisAlignment.center,
                //                                 children: [
                //                                   Text('Bayar Utang'),
                //                                 ],
                //                               ),
                //                             )
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           )
                //           ),
                //       ]
                //     ),

                //   ),
                // ),

                )));
  }
}
