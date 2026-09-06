import 'package:flutter/material.dart';
import 'package:talabat/screens/favourite_screen.dart';
import 'package:talabat/screens/home_page.dart';
import 'package:talabat/screens/settings_screen.dart';
import 'package:talabat/screens/shopping_car_screen.dart';

class AppNavigationBar extends StatefulWidget {
  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    List <Widget> screens =[
      HomePage(),
      FavouriteScreen(),
      ShoppingCarScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "go to home page"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
            tooltip: "go to favourites page"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            tooltip: "go to shopping cart"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            tooltip: "go to settings"
          )
        ],
        onTap:(value) {
          setState((){
            currentIndex = value;
          });
        } ,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFFF55540),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.transparent,
        ),

        body: screens[currentIndex],

    );
  }
}