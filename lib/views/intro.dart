import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // image widget
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    // decoration pageview model
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    // walktrough screen
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Aplikasi P2P Lending untuk UMKM",
          body:
              "LendID adalah aplikasi P2P Lending yang mempersembahkan solusi revolusioner bagi UMKM. Kami memberikan akses mudah, cepat, dan terpercaya untuk mendapatkan dana yang dibutuhkan oleh UMKM.",
          image: _buildImage('lendid_trans.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Berikan Jalan Menuju Kesuksesan",
          body:
              "LendID menghubungkan peminjam UMKM dengan pemberi pinjaman untuk memenuhi kebutuhan pendanaan dalam dunia bisnis yang kompetitif.",
          image: _buildImage('page2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pengalaman Peminjaman Terbaik, Aman, dan Mudah",
          body:
              "LendID menyediakan pengalaman peminjaman terbaik dengan keamanan terjamin dan proses yang mudah.",
          image: _buildImage('page3.png'),
          decoration: pageDecoration,
        ),
      ],

      // button
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      ),
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
      baseBtnStyle: TextButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      doneStyle: TextButton.styleFrom(foregroundColor: Colors.blue),
      nextStyle: TextButton.styleFrom(foregroundColor: Colors.blue),

      // dots
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFFA1E3D8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xFF069A8E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
