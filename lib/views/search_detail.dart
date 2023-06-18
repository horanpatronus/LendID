import 'package:flutter/material.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

import 'package:homepage/views/progress_bar.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/search_detail_confirm.dart';
import 'package:intl/intl.dart';

class SearchDetail extends StatelessWidget {
  final PinjamanUmkmModel pinjaman;
  final int totalDanaTerkumpul;

  const SearchDetail(
      {super.key, required this.pinjaman, required this.totalDanaTerkumpul});

  @override
  Widget build(BuildContext context) {
    DateTime waktuPeminjaman =
        pinjaman.waktuPeminjaman!.toDate(); // Convert Timestamp to DateTime
    Duration difference = waktuPeminjaman.difference(DateTime.now());

    final jumlahPinjaman = pinjaman.jumlahPinjaman ?? 0;
    final persentaseJumlahPinjaman =
        (totalDanaTerkumpul / jumlahPinjaman) * 100;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: ListView(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman akun
                              builder: (context) => SearchButton(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back)),
                    Text("Detail Investasi")
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffA1E3D8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan (x, y)
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                          "Pendanaan Berakhir ${difference.inDays.abs() + 1} Hari Lagi!")),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffA1E3D8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan (x, y)
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "${pinjaman.namaProyek}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffA1E3D8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan (x, y)
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${pinjaman.deskripsiProyek}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  // height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // color: Color(0xffA1E3D8),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 2,
                    //     blurRadius: 5,
                    //     offset: Offset(0, 3), // Mengatur posisi bayangan (x, y)
                    //   ),
                    // ],
                  ),
                  height: 100,

                  child: Center(
                    child: Image(
                      image: NetworkImage(
                        "https://picsum.photos/id/1023/100/100",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffA1E3D8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan (x, y)
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "${pinjaman.namaProyek}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dana Proyek"),
                            Text(
                              "Rp${NumberFormat('#,###', 'id_ID').format(pinjaman.jumlahPinjaman ?? 0)},-",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Imbal"),
                            Text(
                              "${pinjaman.periodePembayaran}%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  "Dana Terkumpul : ${persentaseJumlahPinjaman.toStringAsFixed(2)}%")),
                          CustomProgressBar(
                              width: 300,
                              height: 10,
                              value: totalDanaTerkumpul / jumlahPinjaman,
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xff069A8E))
                        ],
                      ),
                      Divider(
                        // Garis horizontal
                        color: Colors.black,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Estimasi Pelunasan"),
                            Text(
                              "${pinjaman.periodePembayaran! * 30} Hari",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman akun
                              builder: (context) => SearchConfirm(
                                idProyek: pinjaman.id!,
                                model: pinjaman,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff005555),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Investasi",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
          Navigasi(),
          NavigasiMid(),
        ]),
      ),
    );
  }
}
