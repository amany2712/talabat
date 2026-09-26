import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talabat/models/product.dart';

class ProductList extends StatefulWidget {
  Product product;
  ProductList({required this.product});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isFavourite = false;

  Future<void> addToFavourite() async {
    try{
      await FirebaseFirestore.instance
        .collection("favourite_product")
        .doc(widget.product.id.toString())
        .set({
          "brand": widget.product.brand,
          "price" : widget.product.price,
          "rate" : widget.product.rating,
          "title" : widget.product.title,
          "urlimage" : widget.product.thumbnail,
          
        });

      setState(() {
        isFavourite = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Added to favourite"),
          backgroundColor: Color(0xFFF55540),
          )
        );
    }catch(e){
      print(e);
    }
  }

  Future<void> removedFromFavourite () async{
    try{
      await FirebaseFirestore.instance
        .collection("favourite_product")
        .doc(widget.product.id.toString()).delete();
    setState(() {
        isFavourite = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Removed from favourite"),
          backgroundColor: Color(0xFFF55540),
          )
        );

    }catch(e){
      print(e);
    }

  }

 Future<void> checkFavourite () async {
  try{
   DocumentSnapshot document =  await await FirebaseFirestore.instance
        .collection("favourite_product")
        .doc(widget.product.id.toString()).get();

    if (document.exists){
      setState(() {
        isFavourite = true;
      });
    }

  }catch(e){
    print(e);
  }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkFavourite();
  }





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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  "${widget.product.thumbnail}",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: GestureDetector(
                  onTap: () {
                    if (isFavourite){
                      removedFromFavourite();
                    }else{
                      addToFavourite();
                    }
                  },
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                     color: Color(0xFFF55540)
                     ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  widget.product.title ?? "",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.star, color: Color(0xFFF55540), size: 14),
                    Text(
                      "${widget.product.rating ?? 0}",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product.price ?? 0}\$",
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