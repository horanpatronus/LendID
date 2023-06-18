import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/investasi_investor_model.dart';
import 'package:homepage/views/dropdown.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/progress_bar.dart';
import 'package:homepage/views/search_detail.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';

import 'package:intl/intl.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  SearchButtonState createState() => SearchButtonState();
}

class SearchButtonState extends State<SearchButton> {
  String? selectedImbal;
  String? selectedDanaTerkumpul;
  String? selectedWaktuTersisa;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cari Investasi",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Filter :",
                    style: TextStyle(fontSize: 12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownGenerate(
                          title: 'Imbal',
                          menuItems: [
                            '3%',
                            '7%',
                            '9%',
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedImbal = value;
                            });
                          }),
                      DropdownGenerate(
                        title: 'Dana Terkumpul',
                        menuItems: [
                          ' > 25%',
                          ' > 50%',
                          ' > 90%',
                        ],
                        onChanged: (value) {
                          selectedDanaTerkumpul = value;
                        },
                      ),
                      DropdownGenerate(
                        title: 'Waktu Tersisa',
                        menuItems: [
                          'Kurang dari 1 Hari',
                          'Kurang dari 1 Minggu',
                          'Kurang dari 1 Bulan',
                        ],
                        onChanged: (value) {
                          selectedWaktuTersisa = value;
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Hasil Filter :",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 260,
                right: 20,
                left: 20,
              ),
              child: InvestItems(
                selectedImbal: selectedImbal,
                selectedDanaTerkumpul: selectedDanaTerkumpul,
                selectedWaktuTersisa: selectedWaktuTersisa,
                pinjamanList: [],
              ),
            ),
            const Navigasi(),
            const NavigasiMid(),
          ],
        ),
      ),
    );
  }
}

class InvestItems extends StatelessWidget {
  final List<PinjamanUmkmModel> pinjamanList;
  final String? selectedImbal;
  final String? selectedDanaTerkumpul;
  final String? selectedWaktuTersisa;

  const InvestItems({
    Key? key,
    required this.pinjamanList,
    this.selectedImbal,
    this.selectedDanaTerkumpul,
    this.selectedWaktuTersisa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('pinjaman_umkm')
            .where('waktu_peminjaman', isGreaterThanOrEqualTo: Timestamp.now())
            .orderBy('waktu_peminjaman', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            final pinjamanList = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 20,
                childAspectRatio: 9 / 19,
              ),
              itemCount: pinjamanList.length,
              itemBuilder: (BuildContext context, int index) {
                final pinjaman = pinjamanList[index];
                final model = PinjamanUmkmModel.fromDocumentSnapshot(pinjaman);
                final idPinjaman = pinjaman.id;

                DateTime waktuPeminjaman = model.waktuPeminjaman!
                    .toDate(); // Convert Timestamp to DateTime
                Duration difference =
                    waktuPeminjaman.difference(DateTime.now());

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('investasi_investor')
                      .where('proyek_id', isEqualTo: idPinjaman)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final investasiInvestorDocuments = snapshot.data!.docs;

                    final totalDanaTerkumpul =
                        investasiInvestorDocuments.fold<int>(
                      0,
                      (previousValue, document) =>
                          previousValue +
                          InvestasiInvestorModel.fromDocumentSnapshot(document)
                              .danaDiberikan!,
                    );

                    final jumlahPinjaman = model.jumlahPinjaman ?? 0;
                    final persentaseJumlahPinjaman =
                        (totalDanaTerkumpul / jumlahPinjaman) * 100;

                    if (investasiInvestorDocuments.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman akun
                              builder: (context) =>
                                  SearchDetail(pinjaman: model, totalDanaTerkumpul: totalDanaTerkumpul),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Color(0xffA1E3D8),
                                // border: Border.all(width: 2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      "https://picsum.photos/id/1011/300/300",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        model.namaProyek!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dana Proyek",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Rp ${NumberFormat('#,###', 'id_ID').format(model.jumlahPinjaman ?? 0)},-",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 20, left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Imbal",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${model.periodePembayaran}%",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dana Terkumpul",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${persentaseJumlahPinjaman.toStringAsFixed(2)}%",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  CustomProgressBar(
                                    width: 150,
                                    height: 10,
                                    value: persentaseJumlahPinjaman / 100,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xff069A8E),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Color(0xff005555),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Detail Investasi",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // alignment: Alignment.topLeft,
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xffF7FF93),
                                  borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "${difference.inDays.abs() + 1} Hari lagi!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff005555),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman akun
                              builder: (context) =>
                                  SearchDetail(pinjaman: model, totalDanaTerkumpul: totalDanaTerkumpul,),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Color(0xffA1E3D8),
                                // border: Border.all(width: 2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      "https://picsum.photos/id/1011/300/300",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        model.namaProyek!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dana Proyek",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Rp ${NumberFormat('#,###', 'id_ID').format(model.jumlahPinjaman ?? 0)},-",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 20, left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Imbal",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${model.periodePembayaran}%",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dana Terkumpul",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "0%",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  CustomProgressBar(
                                    width: 150,
                                    height: 10,
                                    value: 0,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xff069A8E),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Color(0xff005555),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Detail Investasi",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // alignment: Alignment.topLeft,
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xffF7FF93),
                                  borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "${difference.inDays.abs() + 1} Hari lagi!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff005555),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
          return Text("Data tidak tersedia!");
        });
  }
}
