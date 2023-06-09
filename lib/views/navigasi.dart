import 'package:flutter/material.dart';
import 'package:homepage/views/landing_page.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/settings.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:homepage/views/usulan_peminjaman.dart';

bool isMember = false;

class Navigasi extends StatelessWidget {
  const Navigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return //navigasi
        Align(
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
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  isMember
                      ? MaterialPageRoute(
                          //pergi ke halaman plus button
                          builder: (context) => const ProfilePage(),
                        )
                      : MaterialPageRoute(
                          //pergi ke halaman search button
                          builder: (context) => const StatusInvestor(),
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
                    )),
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
                    )),
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
                        Icons.settings,
                        color: Colors.white,
                      ),
                      Text(
                        "Setelan",
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
    //end navigasi
  }
}
