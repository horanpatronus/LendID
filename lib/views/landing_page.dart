import 'package:flutter/material.dart';
import 'package:homepage/models/pinjaman_umkm_model.dart';
import 'package:homepage/viewmodels/investasi_investor_viewmodel.dart';
import 'package:homepage/viewmodels/pinjaman_umkm_viewmodel.dart';

import 'package:homepage/views/search.dart';
import 'package:homepage/views/topup.dart';
import 'package:homepage/views/topup_status.dart';
import 'package:homepage/views/topup_withdraw.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/login_viewmodel.dart';

import 'carousel.dart';
import 'navigasi.dart';
import 'navigasi_mid.dart';
import 'progress_bar.dart';
import 'profile_user.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider<PinjamanUmkmViewModel>(
          create: (_) => PinjamanUmkmViewModel(),
        ),
        ChangeNotifierProvider<InvestasiInvestorViewModel>(
          create: (_) => InvestasiInvestorViewModel(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final userViewModel = Provider.of<LoginViewModel>(context);
          final pinjamanViewModel = Provider.of<PinjamanUmkmViewModel>(context);
          final investasiViewModel =
              Provider.of<InvestasiInvestorViewModel>(context);

          return FutureBuilder(
            future: Future.wait([
              userViewModel.getCurrentUser(),
              pinjamanViewModel.getPinjamanUmkm(),
              investasiViewModel.getInvestasiInvestor(),
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Handle any error that occurred during data retrieval
                return Text('Error: ${snapshot.error}');
              } else {
                // Data retrieval is complete, access the user's role
                String? userRole = userViewModel.currentUser?.role;
                String? userName = userViewModel.currentUser?.nama;
                String? saldo = NumberFormat('#,###', 'id_ID')
                    .format(userViewModel.currentUser?.saldo ?? 0);

                // Use the user's role as needed in your UI or logic
                bool isMember = userRole == 'UMKM';

                // initialize umkm var
                int totalPeminjaman = 0;
                String jumlahPinjaman = '0';
                String jumlahDibayar = '0';
                String sisaHutang = '0';

                // initialize investor var
                int totalInvestasi = 0;
                int totalSelesai = 0;
                String jumlahDanaDiberikan = '0';
                String estimasiHasil = '0';

                if (isMember) {
                  totalPeminjaman = pinjamanViewModel.totalPeminjaman;
                  jumlahPinjaman = NumberFormat('#,###', 'id_ID')
                      .format(pinjamanViewModel.jumlahPinjaman);
                  jumlahDibayar = NumberFormat('#,###', 'id_ID')
                      .format(pinjamanViewModel.jumlahDibayar);
                  sisaHutang = NumberFormat('#,###', 'id_ID')
                      .format(pinjamanViewModel.sisaHutang);
                } else {
                  totalInvestasi = investasiViewModel.totalInvestasi;
                  totalSelesai = investasiViewModel.totalSelesai;
                  jumlahDanaDiberikan = NumberFormat('#,###', 'id_ID')
                      .format(investasiViewModel.jumlahDanaDiberikan);
                  estimasiHasil = NumberFormat('#,###', 'id_ID')
                      .format(investasiViewModel.estimasiHasil);
                }

                return Scaffold(
                  body: Container(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: ListView(
                            children: [
                              //content 1
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Hai $userName",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              //end content 1
                              //content 2
                              Container(
                                color: const Color(0xFFA1E3D8),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Progress Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 5,
                                            child: CustomProgressBar(
                                              width: 300,
                                              height: 10,
                                              value: 0.6,
                                              backgroundColor: Colors.white,
                                              foregroundColor:
                                                  Color(0xff069A8E),
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: const Text(
                                        "Lorem Ipsum ntuk merubah ukuran teks di Flutter, Anda dapat menggunakan properti",
                                        style: TextStyle(fontSize: 11),
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
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
                                                  builder: (context) =>
                                                      ProfilePage(),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                color: const Color(0xffA1E3D8),
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Saldo",
                                                style: TextStyle(fontSize: 10)),
                                            Text(
                                              "Rp$saldo,-",
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
                                              builder: (context) => TopUpPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //     width: 2, color: Colors.white),
                                            color: Color(0xff069A8E),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.arrow_circle_up,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Top Up",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
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
                                              builder: (context) =>
                                                  WithdrawPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //   width: 2,
                                            //   color: Colors.white,
                                            // ),
                                            color: Color(0xff069A8E),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.arrow_circle_down,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              Text("Withdraw",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  )),
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
                                              builder: (context) =>
                                                  RiwayatPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Color(0xff069A8E),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.description,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              Text("Riwayat",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  )),
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
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    widthFactor: 1,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Total Peminjaman Berjalan",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                            "$totalPeminjaman"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    widthFactor: 1,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Jumlah Dana Pinjaman",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                            "Rp$jumlahPinjaman,-"),
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
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    widthFactor: 1,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Jumlah Utang Terlunasi",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                            "Rp$jumlahDibayar,-"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    widthFactor: 1,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Sisa Utang",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text("Rp$sisaHutang,-"),
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
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Total Investasi yang Berjalan",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text("$totalInvestasi"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Total Investasi yang Selesai",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text("$totalSelesai"),
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
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Jumlah Dana yang Diberikan",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(
                                                          "Rp$jumlahDanaDiberikan,-"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Estimasi Hasil Imbal",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(
                                                          "Rp$estimasiHasil,-"),
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
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
                );
              }
            },
          );
        },
      ),
    );
  }
}
