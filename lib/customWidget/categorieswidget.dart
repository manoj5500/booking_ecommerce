import 'package:bookingproject/screens/controller/navigatorcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Categorieswidget extends StatefulWidget {
  const Categorieswidget({super.key});

  @override
  State<Categorieswidget> createState() => _CategorieswidgetState();
}

class _CategorieswidgetState extends State<Categorieswidget> {
  final NavigationController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var item in navController.items) 
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(item["image"], width: 40, height: 40),
                  SizedBox(width: 8), // Add spacing
                  Text(
                    item["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
