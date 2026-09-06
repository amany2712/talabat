import 'package:flutter/material.dart';
import 'package:talabat/card_list.dart';
import 'package:talabat/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<Map<String, dynamic>> products = [
      {
        "url": "assets/images/burger.png",
        "title": "Big Burger Spicy",
        "price": "150",
        "review": "5.0",
      },
      {
        "url": "assets/images/shrimp.png",
        "title": "Big Shrimp Delight",
        "price": "200",
        "review": "4.8",
      },
      {
        "url": "assets/images/steak.png",
        "title": "Big Steak Delight",
        "price": "250",
        "review": "4.9",
      },
      {
        "url": "assets/images/steak.png",
        "title": "Big Steak Delight",
        "price": "250",
        "review": "4.9",
      },
      {
        "url": "assets/images/steak.png",
        "title": "Big Steak Delight",
        "price": "250",
        "review": "4.9",
      },
      {
        "url": "assets/images/steak.png",
        "title": "Big Steak Delight",
        "price": "250",
        "review": "4.9",
      },
    ];
    List <String> categories =[
      "Fast Food",
      "Burger",
      "Pizza",
      "Steak",
      "Salads",
      "Drinks"
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 178, 177, 177),
                      radius: 30,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    Text(
                      "Hello , Ahmed",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 16),
                    ),
                  ],
                ),
            
                //textFormField
                TextFormField(
                  cursorColor: Color(0xFFF55540),
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xFFF55540), fontSize: 15),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xFFF55540),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
            
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFF55540)),
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFF55540)),
                    ),
                  ),
                ),
            
                SizedBox(
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CardList(
                        text: categories[index],
                        colorText: index==0 ? Colors.white : Colors.black,
                        colorCard: index==0 ? Color(0xFFF55540) : Color(0xFFF3F4F6),
                      );;
                    },
                  ),
                ),
            
                //grid
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return ProductList(
                      price: products[index]["price"],
                      title: products[index]["title"],
                      review: products[index]["review"],
                      urlImage: products[index]["url"],
                    );
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
