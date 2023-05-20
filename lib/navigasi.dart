import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: const Flexible(
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
            Container(
              child: const Flexible(
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
            const Spacer(),
            Container(
              child: const Flexible(
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
            Container(
              child: const Flexible(
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
                  )),
            ),
          ],
        ),
      ),
    );
    //end navigasi
  }
}
