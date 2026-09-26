import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  String productId;
  String urlImage;
  String title;
  double price;
  double rate;
  String brand;
  FavouriteCard({
    required this.productId,
    required this.urlImage,
    required this.title,
    required this.price,
    required this.rate,
    required this.brand,
  });

  Future<void> removedFromFavourite() async {
    await FirebaseFirestore.instance
        .collection("favourite_product")
        .doc(productId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                urlImage,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                  );
                },
              ),
            ),

            SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    brand,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  SizedBox(height: 4),
                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        "$price\$",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 4),
                      Text(
                        "$rate",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Icon(Icons.star, size: 16, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),

            IconButton(
              onPressed: () {
                removedFromFavourite();
              },
              icon: Icon(
                Icons.favorite, size: 24,
                 color: Color(0xFFF55540)),
            ),
          ],
        ),
      ),
    );
  }
}
