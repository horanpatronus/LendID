import 'package:flutter/material.dart';
import 'package:homepage/views/landing_page.dart';
import 'package:homepage/views/navigasi.dart';
import 'package:homepage/views/navigasi_mid.dart';

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //pergi ke halaman akun
                      builder: (context) => LandingPage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Text("Top Up"),
            ],
          ),
          backgroundColor: Color(0xFF005555),
          // iconTheme: IconThemeData(color: Colors.amber),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Scan this QR Code to top up your account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'qr.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
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
}
