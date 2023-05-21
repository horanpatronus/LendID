import 'package:flutter/material.dart';

import 'package:homepage/views/search.dart';

import 'carousel.dart';
import 'navigasi.dart';
import 'navigasi_mid.dart';
import 'progress_bar.dart';
import 'profile_user.dart';

bool isMember = false;

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: ListView(
                  children: [
                    //content 1
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Hai Username",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                    //end content 1
                    //content 2
                    Container(
                      color: const Color(0xFFA1E3D8),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Progress Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: CustomProgressBar(
                                    width: 300,
                                    height: 10,
                                    value: 0.6,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xff069A8E),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text("8/10"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: const Text(
                              "Lorem Ipsum ntuk merubah ukuran teks di Flutter, Anda dapat menggunakan properti",
                              style: TextStyle(fontSize: 11),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            color: const Color(0xff069A8E),
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        //pergi ke halaman akun
                                        builder: (context) => ProfilePage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Lengkapi Profilmu",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end content 2
                    //content 3
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      color: const Color(0xffA1E3D8),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Saldo", style: TextStyle(fontSize: 10)),
                                  Text(
                                    "Rp150.000.000,-",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //ke halaman top up page
                                    builder: (context) => SearchButton(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Top Up",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //pergi ke halaman withdraw
                                    builder: (context) => SearchButton(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_down,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text("Withdraw",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //pergi ke halaman riwayat
                                    builder: (context) => SearchButton(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.description,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text("Riwayat",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end content 3
                    //content 4
                    isMember
                        ? Container(
                            //dashboard umkm
                            padding: const EdgeInsets.all(20),
                            color: const Color(0xffA1E3D8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Total Peminjaman Berjalan",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text("5"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jumlah Dana Pinjaman",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text("Rp10.000.000,-"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jumlah Utang Terlunasi",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text("Rp1.000.000,-"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const FractionallySizedBox(
                                          widthFactor: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Sisa Utang",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text("Rp9.000.000,-"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(
                            //dashboard investor
                            padding: const EdgeInsets.all(20),
                            color: const Color(0xffA1E3D8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const Column(
                                          children: [
                                            Text(
                                              "Total Investasi yang Berjalan",
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text("5"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const Column(
                                          children: [
                                            Text(
                                              "Total Investasi yang Selesai",
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text("10"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const Column(
                                          children: [
                                            Text(
                                              "Jumlah Dana yang Diberikan",
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text("Rp10.000.000,-"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const Column(
                                          children: [
                                            Text(
                                              "Estimasi Hasil Imbal",
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text("Rp1.000.000,-"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    //end content 4
                    //content5
                    isMember
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: const Text(
                                    "Rekomendasi Investasi",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Carousel(),
                              ],
                            ),
                          ),
                    //end content 5
                    Container(
                      color: Colors.white,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const Navigasi(),
              const NavigasiMid(),
            ],
          ),
        ),
      ),
    );
  }
}