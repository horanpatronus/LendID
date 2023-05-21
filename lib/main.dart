import 'package:flutter/material.dart';
import 'package:homepage/edit_profile_user.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:homepage/carousel.dart';
import 'package:homepage/intro.dart';
// import 'package:homepage/search.dart';
// import 'package:homepage/settings.dart';
// import 'landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: OnBoardingPage());
  }
}
