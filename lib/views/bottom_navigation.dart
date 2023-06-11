import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:homepage/views/landing_page.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/search.dart';
import 'package:homepage/views/settings.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:homepage/views/usulan_peminjaman.dart';

bool isMember = true;

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final List<Widget> widgetsInvestor = [
    LandingPage(),
    StatusInvestor(),
    SearchButton(),
    ProfilePage(),
    SettingsPage(),
  ];
  final List<Widget> widgetsUMKM = [
    LandingPage(),
    UsulanPeminjaman(),
    UsulanPeminjaman(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget getCurrentWidget() {
      if (isMember) {
        return widgetsUMKM[currentIndex];
      } else {
        return widgetsInvestor[currentIndex];
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                return getCurrentWidget();
              },
            );
          },
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color(0xff005555),
          style: TabStyle.fixedCircle,
          items: [
            TabItem(icon: Icons.home, title: 'Beranda'),
            TabItem(icon: Icons.assignment, title: 'Status'),
            isMember
                ? TabItem(
                    icon: Icons.add,
                    title: 'Add',
                    isIconBlend: true,
                  )
                : TabItem(
                    icon: Icons.search,
                    title: 'Search',
                    isIconBlend: true,
                  ),
            TabItem(icon: Icons.person, title: 'Akun'),
            TabItem(icon: Icons.settings, title: 'Setelan'),
          ],
          // currentIndex: currentIndex,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
        ),
      ),
    );
  }
}
