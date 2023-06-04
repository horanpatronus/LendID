import 'package:flutter/material.dart';
import 'package:homepage/views/edit_profile_perusahaan.dart';
import 'package:homepage/views/profile_user.dart';
import 'package:homepage/views/topup.dart';
import 'package:homepage/views/topup_status.dart';
import 'package:homepage/views/topup_withdraw.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'views/intro.dart';
import 'views/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
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
      home: WithdrawPage(),
    );
  }
}
