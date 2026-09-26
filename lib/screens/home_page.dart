import 'package:flutter/material.dart';
import 'package:talabat/card_list.dart';
import 'package:talabat/models/product.dart';
import 'package:talabat/product_list.dart';
import 'package:talabat/services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  ProductApi productApi = ProductApi();
  Future<void> fetchProducts() async {
    products = await productApi.getProduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  List<Product> products = [];
  bool isLoading = true;

  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    List<String> categories = products
        .map((product) => product.category ?? "")
        .where((category) => category.isNotEmpty)
        .toSet()
        .toList();

    List<Product> filteredProducts = selectedCategory == null
        ? products
        : products.where((product) {
            return product.category == selectedCategory;
          }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xFFF55540)),
                )
              : SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(
                              255,
                              178,
                              177,
                              177,
                            ),
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Text(
                            "Hello , Ahmed",
                            style: TextStyle(
                              color: Color(0xFF515151),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      //textFormField
                      TextFormField(
                        cursorColor: Color(0xFFF55540),
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Color(0xFFF55540),
                            fontSize: 15,
                          ),
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
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = categories[index];
                                });
                              },
                              child: CardList(
                                text: categories[index],
                                colorText: selectedCategory==categories[index]
                                    ? Colors.white
                                    : Colors.black,
                                colorCard: selectedCategory==categories[index]
                                    ? Color(0xFFF55540)
                                    : Color(0xFFF3F4F6),
                              ),
                            );
                            ;
                          },
                        ),
                      ),

                      //grid
                      filteredProducts.isEmpty
                          ? Center(
                            child: Text("No Products found",
                            style: TextStyle(color: Color(0xFFF55540)
                            ),))
                          : GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: filteredProducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.6,
                                  ),
                              itemBuilder: (context, index) {
                                return ProductList(
                                  product: filteredProducts[index],
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
