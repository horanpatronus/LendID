import 'package:flutter/material.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:homepage/views/status_peminjaman_umkm.dart';
import 'package:provider/provider.dart';

class HistoryUMKM extends StatelessWidget {
  const HistoryUMKM({super.key});

  //variabel card
  final String _namaProyek = "Nama Proyek";
  final String _deskripsiProyek =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  final String _danaDipinjam = "Rp2.000.000";
  final String _bunga = "Rp100.000 (3%)";
  final String _utang = "Rp2.100.000";
  final String _tglPeminjaman = "5 Januari 2023";
  final String _tglPelunasan = "15 Maret 2023";

  //variabel dashboard
  final int _totalPeminjaman = 10;
  final String _totalDanaDipinjam = "Rp10.000.000";
  final String _totalUtangDibayar = "Rp9.000.000";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PinjamanUmkmViewModel>(
        create: (_) => PinjamanUmkmViewModel(),
        child: Builder(builder: (context) {
          final umkmViewModel = Provider.of<PinjamanUmkmViewModel>(context);

          return FutureBuilder(
              future: Future.wait<void>([umkmViewModel.getPinjamanUmkm()]),
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
                      umkmViewModel.mergedListSelesai;

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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                //pergi ke halaman akun
                                                builder: (context) =>
                                                    StatusPeminjamanUMKM(),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.arrow_back)),
                                      Container(
                                        width: 10,
                                      ),
                                      Text(
                                        "Riwayat Peminjaman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  margin: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    color: Color(0xff069A8E),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(0,
                                            5), // Mengatur posisi bayangan (x, y)
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Ringkasan Riwayat Peminjaman",
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
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Icon(
                                                Icons
                                                    .assignment_turned_in_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "Total Peminjaman yang Selesai"),
                                                Text(
                                                  mergedListSelesai.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Icon(
                                                Icons.request_quote_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "Jumlah Dana yang Dipinjam"),
                                                Text(
                                                  umkmViewModel
                                                      .jumlahDanaDipinjam
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Icon(
                                                Icons.stacked_line_chart,
                                                size: 30,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "Jumlah Utang yang Dibayar"),
                                                Text(
                                                  umkmViewModel
                                                      .jumlahUtangTerbayar
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                          '${data['nama_proyek']}',
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
                                                Text("Dana yang dipinjam"),
                                                Text(
                                                  '${data['jumlah_pinjaman']}',
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
                                                  Text("Bunga yang didapat"),
                                                  Text(
                                                    umkmViewModel.bungaDidapat
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Total Utang"),
                                                  Text(
                                                    '${data['jumlah_pembayaran']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Tanggal Peminjaman"),
                                                  Text(
                                                    '${data['tanggal_peminjaman']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Tanggal Pelunasan"),
                                                  Text(
                                                    '${data['tanggal_pelunasan']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
