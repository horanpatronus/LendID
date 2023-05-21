import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homepage/progress_bar.dart';
import 'landing_page.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 99 / 100,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        // height: 400.0,
        viewportFraction: 0.6,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //pergi ke halaman top up
                    builder: (context) => LandingPage(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Color(0xffA1E3D8),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                              "https://picsum.photos/id/1011/300/300",
                            ),
                            fit: BoxFit.cover,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                "Nama Proyek",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dana Proyek"),
                              Text("Rp2.000.000,-")
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Imbal"), Text("3%")],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                              right: 10,
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Dana Terkumpul"), Text("50%")],
                            ),
                          ),
                          CustomProgressBar(
                            width: 200,
                            height: 10,
                            value: 0.6,
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xff069A8E),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color(0xffF7FF93),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "30 Hari lagi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff005555),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
