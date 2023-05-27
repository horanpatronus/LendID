import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final double discount;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
    required this.description,
  });
}

List<Product> products = [
  Product(
    name: 'Product 1',
    image: 'https://example.com/images/product1.jpg',
    price: 10.99,
    discount: 20,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 2',
    image: 'https://example.com/images/product2.jpg',
    price: 15.99,
    discount: 10,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
    Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  Product(
    name: 'Product 3',
    image: 'https://example.com/images/product3.jpg',
    price: 8.99,
    discount: 30,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),

];

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                product.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${product.discount}% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
                child: Text('Details'),
              ),
            ),
          ),
        ],
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
      body: Center(
        child: Text('Product Detail Page'),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductListPage(),
  ));
}
