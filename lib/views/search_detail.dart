import 'package:flutter/material.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

import 'package:homepage/views/progress_bar.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/search_detail_confirm.dart';

class SearchDetail extends StatelessWidget {
  const SearchDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Center(child: Text("Pendanaan Berakir 3 Hari Lagi!")),
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
                    "UMKM Aku Laku",
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
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                          "Nama Proyek",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Dana Proyek"),
                            Text(
                              "Rp30.000.000,-",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Imbal"),
                            Text(
                              "3%",
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
                              child: Text("Dana Terkumpul : 50%")),
                          CustomProgressBar(
                              width: 300,
                              height: 10,
                              value: 67.9 / 100,
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
                              "90 Hari",
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
                              builder: (context) => SearchConfirm(),
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
