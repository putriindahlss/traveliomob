// Importing necessary packages for Flutter and custom widgets.
import 'package:flutter/material.dart';
import 'package:traveliomob/widgets/left_drawer.dart';
import 'package:traveliomob/widgets/shop_card.dart';

// A StatelessWidget representing the main page of the ScoobyMart application.
class MyHomePage extends StatelessWidget {
  // Constructor for the MyHomePage class.
  MyHomePage({Key? key}) : super(key: key);

  // List of ShopItem objects representing menu items.
  final List<ShopItem> items = [
    ShopItem("Show Items", Icons.checklist, Colors.pink),
    ShopItem("Add an Item", Icons.add_shopping_cart, Colors.lightGreen),
    ShopItem("Logout", Icons.logout, Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the main page.
    return Scaffold(
      // Setting up the app bar with a title and styling.
      appBar: AppBar(
        title: const Text(
          'ScoobyMart',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // Including the LeftDrawer widget for navigation.
      drawer: const LeftDrawer(),

      // Wrapping the body in a SingleChildScrollView for scrolling.
      body: SingleChildScrollView(
        // Padding to provide space around the content.
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              // Text widget welcoming the user to ScoobyMart.
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to ScoobyMart!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // GridView displaying menu items using ShopCard widget.
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}