import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  String urlImage;
  String title;
  String price;
  String review;

  ProductList({
    required this.urlImage,
    required this.title,
    required this.price,
    required this.review,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              "$urlImage",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFF55540),
                      size: 14,
                    ),
                    Text(
                      review,
                      style: TextStyle(color: Color(0xFF515151), fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$price\$",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 13),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF55540),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//gridview.builder