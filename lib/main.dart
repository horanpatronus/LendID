import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:homepage/views/bottom_navigation.dart';
import 'package:homepage/views/history_investor.dart';
import 'package:homepage/views/history_umkm.dart';
import 'package:homepage/views/landing_page.dart';
import 'package:homepage/views/login_page.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/settings.dart';
import 'package:homepage/views/status_investor.dart';
import 'package:homepage/views/topup_status.dart';
import 'package:homepage/views/topup_withdraw.dart';

import 'views/intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(),
    );
  }
}
