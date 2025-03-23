import 'package:bookingproject/screens/navigator/navigatorPage.dart';
import 'package:bookingproject/screens/view/bookingpages/bookingconfirmpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:bookingproject/screens/favorites_page.dart'; // Import FavoritesPage

// import 'package:localstorage/localstorage.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

class Itembuttomnavbar extends StatelessWidget {
  final Map<String, dynamic> item;

  const Itembuttomnavbar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF4C53A5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5),
                child: Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "\$${item["price"]}",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to FavoritesPage and pass item data
                Get.to(() => FavoritesPage(), arguments: item);
              },
              icon: Icon(CupertinoIcons.cart_badge_plus),
              label: Text(
                "Buy Now",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


