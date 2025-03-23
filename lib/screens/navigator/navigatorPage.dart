import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bookingproject/screens/controller/navigatorcontroller.dart';

class Navigatorpage extends StatelessWidget {
  Navigatorpage({super.key});

  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: navigationController.pages[navigationController.selectedIndex.value], // Dynamic page switching
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Color(0xff4C53A5),
            height: 70,
            onTap: (index) {
              navigationController.changePage(index); 
            },
            items: const [
              Icon(Icons.home, size: 30, color: Colors.white),
              Icon(Icons.favorite, size: 30, color: Colors.white), // Favorite icon
              Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            ],
          ),
        ));
  }
}
