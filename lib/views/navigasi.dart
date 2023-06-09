import 'package:flutter/material.dart';
import 'package:homepage/views/landing_page.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/settings.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:homepage/views/status_peminjaman_umkm.dart';
import 'package:homepage/views/usulan_peminjaman.dart';

import 'package:provider/provider.dart';
import 'package:homepage/viewmodels/login_viewmodel.dart';

bool isMember = false;

class Navigasi extends StatelessWidget {
  const Navigasi({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: Builder(builder: (context) {
        final loginViewModel = Provider.of<LoginViewModel>(context);

        return FutureBuilder(
          future: Future.wait([loginViewModel.getCurrentUser()]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String? role = loginViewModel.currentUser?.role;
              bool isMember = role == 'UMKM';

              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: const Color(0xff005555),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman Landing Page
                              builder: (context) => const LandingPage(),
                            ),
                          );
                        },
                        child: Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Beranda",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            isMember
                                ? MaterialPageRoute(
                                    //pergi ke halaman plus button
                                    builder: (context) =>
                                        const StatusPeminjamanUMKM(),
                                  )
                                : MaterialPageRoute(
                                    //pergi ke halaman search button
                                    builder: (context) =>
                                        const StatusInvestor(),
                                  ),
                          );
                        },
                        child: Container(
                          child: Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.assignment,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Status",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      GestureDetector(
                        child: Container(
                          child: Flexible(
                            flex: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman Profile
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Akun",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //pergi ke halaman top up
                              builder: (context) => SettingsPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.help,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Bantuan",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
