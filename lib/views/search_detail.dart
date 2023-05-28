import 'package:flutter/material.dart';

import 'package:homepage/views/progress_bar.dart';

class SearchDetail extends StatelessWidget {
  const SearchDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [Icon(Icons.arrow_back), Text("Detail Investasi")],
              ),
              Container(
                child: Center(child: Text("Pendanaan Berakir 3 Hari Lagi!")),
              ),
              Container(
                child: Center(child: Text("UMKM Aku Laku")),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Deskripsi"),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.amber,
                child: Center(
                  child: Image(
                    image: NetworkImage(
                      "https://picsum.photos/id/1023/100/100",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text("Nama Proyek"),
                  ),
                  Row(
                    children: [
                      Text("Dana Proyek"),
                      Text(
                        "Rp30.000.000,-",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: [
                      Text("Imbal"),
                      Text(
                        "3%",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Column(
                    children: [
                      Text("Dana Terkumpul : 50%"),
                      CustomProgressBar(
                          width: 300,
                          height: 10,
                          value: 67.9 / 100,
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black26)
                    ],
                  ),
                  Container(
                    child: Text("Garis"),
                  ),
                  Row(
                    children: [
                      Text("Estimasi Pelunasan"),
                      Text(
                        "90 Hari",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "Investasi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
