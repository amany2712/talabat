import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talabat/favourite_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        centerTitle: true,
        backgroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("favourite_product").snapshots(),
            builder: (context, snapshot) {

              //loading
              if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFF55540),
                  ),
                  );
              }

              //error
              if(snapshot.hasError){
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                  );
              }

              //no favourites
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text("No Favourites yet!"),
                  );
              
                
                
              }

              final favouriteProducts = snapshot.data!.docs;

              return ListView.builder(
                itemCount: favouriteProducts.length,
                itemBuilder: (context, index) {
                  final document = favouriteProducts[index];
                  final productData = document.data() as Map<String, dynamic>;

                  return FavouriteCard(
                    productId: document.id,
                    brand: productData["brand"]?? "",
                    price: productData["price"]?? 0,
                    rate: productData["rate"]?? 0,
                    title: productData["title"]?? "",
                    urlImage: productData["urlimage"]?? "",
                  );
                },
                );

              
            }
            
          )
        ),
      
    );
  }
}