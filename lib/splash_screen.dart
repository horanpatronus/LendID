import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE1E2DB),
        body: Center(
          child: Container(
            width: width * 0.4,
            height: height * 0.6,
            child: Image.asset("lendID_trans.png"),
          ),
        ),
      ),
    );
  }
}
