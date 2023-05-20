import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homepage/card.dart';
import 'package:homepage/navigasi.dart';
import 'package:homepage/navigasi_mid.dart';

class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});
}

List<Product> products = [
  Product(name: 'Product 1', description: 'Description of Product 1'),
  Product(name: 'Product 2', description: 'Description of Product 2'),
  Product(name: 'Product 3', description: 'Description of Product 3'),
  Product(name: 'Product 4', description: 'Description of Product 4'),
  Product(name: 'Product 5', description: 'Description of Product 5'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
  Product(name: 'Product 6', description: 'Description of Product 6'),
];

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cari Investasi",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Search Bar"),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: ProductListPage()
                // GridView.builder(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     mainAxisSpacing: 10,
                //     crossAxisSpacing: 10,
                //     childAspectRatio: 3 / 4,
                //   ),
                //   itemCount: 100,
                //   itemBuilder: (BuildContext context, int index) {
                //     return GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => ProductDetailPage(
                //               product: products[index],
                //             ),
                //           ),
                //         );
                //       },
                //       child: ProductListPage(),
                //     );
                //   },
                // ),
                ),
            Navigasi(),
            NavigasiMid(),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
