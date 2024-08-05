import 'package:flutter/material.dart';
import 'DetailsPage.dart';
import 'product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                // Pass the actual product instance, not the type 'Product'
                return Detailspage(
                  product: product, // corrected this line
                );
              },
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  product.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(product.title),
                subtitle: Text(product.catagory),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(product.price),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Text(product.rating),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
