import 'package:flutter/material.dart';
import 'package:homepage/views/dropdown.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/progress_bar.dart';
import 'package:homepage/views/search_detail.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

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
                      ),
                      DropdownGenerate(
                        title: 'Dana Terkumpul',
                        menuItems: [
                          ' > 25%',
                          ' > 50%',
                          ' > 90%',
                        ],
                      ),
                      DropdownGenerate(
                        title: 'Waktu Tersisa',
                        menuItems: [
                          'Kurang dari 1 Hari',
                          'Kurang dari 1 Minggu',
                          'Kurang dari 1 Bulan',
                        ],
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
              child: InvestItems(),
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
  const InvestItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 20,
        childAspectRatio: 9 / 19,
      ),
      itemCount: 1000,
      itemBuilder: (BuildContext context, int index) {
        // final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //pergi ke halaman akun
                builder: (context) => SearchDetail(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Nama Proyek",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dana Proyek",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Rp2.000.000,-",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Imbal",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "3%",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dana Terkumpul",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "50%",
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
                      value: 0.6,
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
                    "30 Hari lagi",
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
      },
    );
  }
}
