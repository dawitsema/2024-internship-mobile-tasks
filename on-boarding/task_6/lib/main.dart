import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_6/pages/AddPage.dart';
import 'package:task_6/pages/SearchPage.dart';
import 'pages/ProductCard.dart';
import 'pages/SearchPage.dart';
import 'pages/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var f = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(63, 81, 243, 1),
        ),
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Product product1 = Product(
      title: 'Pacific Bow',
      catagory: 'Mens Shoes',
      description:
          'Style: Sports Season: Winter, Autumn Upper Material: Synthetic Leather Fashion Element: Sewing Line Toe Shape: Round Head Heel Height: Flat Heel Wearing Style: Front Lace-up',
      rating: '4',
      imagePath: 'images/shoes2.jpg',
      price: '\$120');

  final Product product2 = Product(
      title: 'Sweat-Absorbant',
      catagory: 'BRAND',
      description:
          'Now, create the second screen. The title of the screen contains the title of the todo, and the body of the screen shows the description.',
      rating: '4',
      imagePath: 'images/shoes.jpg',
      price: '\$100');

  final Product product3 = Product(
    title: 'Running Shoes',
    catagory: 'Sneaker',
    description:
        'To learn clean architecture, two resources have been provided. The first is the Flutter TDD Clean Architecture Course on Reso Coder, which focuses on building a Number Trivia App using clean architecture principles and test-driven development (TDD) in Flutter.',
    rating: '5',
    imagePath: 'images/shoes3.jpg',
    price: '\$129',
  );

  @override
  Widget build(BuildContext context) {
    List<Product> products = [];

    products.addAll([product1, product2, product3]);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppBar(
            title: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'June 12, 2023',
                  style: TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 14,
                    height: 1.3, // Line height
                    letterSpacing: 0.0,
                  ),
                ),
                Text(
                  'Hello, Dawit',
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.26, // Line height
                  ),
                ),
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(204, 204, 204, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(6), // Rounded corners
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 192, 192, 192), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.notifications,
                        // color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(63, 81, 243, 1), // Dot color
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Products',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  width: 40, // Adjust width as needed
                  height: 40, // Adjust height as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(204, 204, 204, 1),
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return SearchPage(
                                products: products,
                              );
                              return SearchPage(
                                products: products,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.search)),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Assuming there are 3 items
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Addpage();
              },
            ),
          );
        },
        backgroundColor:
            const Color.fromRGBO(63, 81, 243, 1), // Background color
        foregroundColor: Colors.white, // Icon color
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
