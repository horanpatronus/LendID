import 'package:flutter/material.dart';

import 'navigasi.dart';
import 'navigasi_mid.dart';
import 'progress_bar.dart';

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
                              child: const FractionallySizedBox(
                                widthFactor: 1,
                                child: Text(
                                  "Lengkapi Profilmu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
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
                          Flexible(
                            flex: 1,
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
                          Flexible(
                            flex: 1,
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
                                  Text("Top Up",
                                      style: TextStyle(fontSize: 10)),
                                ],
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
                                MyCarousel(),
                              ],
                            ),
                          ),
                    //end content 5
                  ],
                ),
              ),

              // //navigasi
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: 80,
              //     color: Color(0xff005555),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           child: Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Icon(
              //                     Icons.home_rounded,
              //                     color: Colors.white,
              //                   ),
              //                   Text(
              //                     "Beranda",
              //                     style: TextStyle(
              //                       fontSize: 11,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   )
              //                 ],
              //               )),
              //         ),
              //         Container(
              //           child: Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Icon(
              //                     Icons.assignment,
              //                     color: Colors.white,
              //                   ),
              //                   Text(
              //                     "Status",
              //                     style: TextStyle(
              //                       fontSize: 11,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   )
              //                 ],
              //               )),
              //         ),
              //         Spacer(),
              //         Container(
              //           child: Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Icon(
              //                     Icons.person,
              //                     color: Colors.white,
              //                   ),
              //                   Text(
              //                     "Akun",
              //                     style: TextStyle(
              //                       fontSize: 11,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   )
              //                 ],
              //               )),
              //         ),
              //         Container(
              //           child: Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Icon(
              //                     Icons.settings,
              //                     color: Colors.white,
              //                   ),
              //                   Text(
              //                     "Setelan",
              //                     style: TextStyle(
              //                       fontSize: 11,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   )
              //                 ],
              //               )),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // //end navigasi
              const Navigasi(),
              // //search button
              // Align(
              //   alignment: Alignment(0, 0.9),
              //   child: Container(
              //     height: 70,
              //     width: 70,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Color(0xff005555),
              //       border: Border.all(
              //         color: Colors.white,
              //         width: 5.0,
              //       ),
              //     ),
              //     child: Icon(
              //       isMember ? Icons.add : Icons.search_rounded,
              //       color: Colors.white,
              //       size: 40,
              //     ),
              //   ),
              // )
              // //end search button
              const NavigasiMid(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCarousel extends StatelessWidget {
  final List<String> imageList = [
    "https://picsum.photos/id/1011/300/200",
    "https://picsum.photos/id/1015/300/200",
    "https://picsum.photos/id/1033/300/200",
    "https://picsum.photos/id/1040/300/200",
    "https://picsum.photos/id/1051/300/200"
  ];

  MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    image: imageList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    child: const Text("Aww"),
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String image;

  const DetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            "Detail Page",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
