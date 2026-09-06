import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  String text;
  Color colorText;
  Color colorCard;

  CardList({
  required this.text,
  required this.colorText,
  required this.colorCard
  });


  @override
  Widget build(BuildContext context) {
    return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:  colorText,
                  ),),
                ),
                color: colorCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.all(16),
                borderOnForeground: true,
                
              );
  }
}