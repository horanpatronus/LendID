import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homepage/navigasi.dart';
import 'package:homepage/navigasi_mid.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ListView(
                children: [Container(), Container()],
              ),
            ),
            Navigasi(),
            NavigasiMid(),
          ],
        ),
      ),
    );
  }
}
