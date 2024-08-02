import 'package:flutter/material.dart';
import 'package:task_6/pages/DetailsPage.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                return const Detailspage();
              },
            ),
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  'images/shoes.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const ListTile(
                title: Text('Derby Leather Shoes'),
                subtitle: Text('Men\'s shoe'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$120'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Text('(4.0)'),
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
