import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView(
            children: [
              //content 1
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Hai Usernam",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              //end content 1
              //content 2
              Container(
                color: Color(0xFFA1E3D8),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Progress Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                        textAlign: TextAlign.end),
                    Center(
                      child: Row(
                        children: [
                          CustomProgressBar(
                            width: 200,
                            height: 10,
                            value: 0.6,
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xff069A8E),
                          ),
                          Text("8/10"),
                        ],
                      ),
                    ),
                    Text(
                      "Lorem Ipsum ntuk merubah ukuran teks di Flutter, Anda dapat menggunakan properti",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        color: Color(0xff069A8E),
                        child: FractionallySizedBox(
                          widthFactor: 0.95,
                          child: Text(
                            "Lengkapi Profilmu",
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
              ),
              //end content 2
              //content 3
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Color(0xffA1E3D8),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            "Saldo",
                          ),
                          Text("Rp150.000.000,-")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_circle_up,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text("Top Up"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_circle_down,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text("Withdraw"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Icon(
                                Icons.description,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text("Top Up"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //end content 3
              //content 4
              Container(
                padding: EdgeInsets.all(20),
                color: Color(0xffA1E3D8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                "Total Investasi \n yang Berjalan",
                              ),
                              Text("5"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Total Investasi \n yang Selesai"),
                              Text("10"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Jumlah Dana \n yang Diberikan"),
                              Text("Rp10.000.000,-"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Estimasi \n Hasil Imbal"),
                              Text("Rp1.000.000,-"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //end content 4
              //content5
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Rekomendasi Investasi"),
                    MyCarousel(),
                  ],
                ),
              ),
              //end content 5
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double value;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomProgressBar({
    Key? key,
    required this.width,
    required this.height,
    required this.value,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
          FractionallySizedBox(
            widthFactor: value,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/seed/1/300/200',
    'https://picsum.photos/seed/2/300/200',
    'https://picsum.photos/seed/3/300/200',
    'https://picsum.photos/seed/4/300/200',
    'https://picsum.photos/seed/5/300/200',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class MyCarousel extends StatelessWidget {
  final List<String> imageList = [
    "https://picsum.photos/id/1011/300/200",
    "https://picsum.photos/id/1015/300/200",
    "https://picsum.photos/id/1033/300/200",
    "https://picsum.photos/id/1040/300/200",
    "https://picsum.photos/id/1051/300/200"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    image: imageList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String image;

  const DetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "Detail Page",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
