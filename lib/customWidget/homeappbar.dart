import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';

class Homeappbar extends StatefulWidget {
  const   Homeappbar({super.key});

  @override
  State<Homeappbar> createState() => _HomeappbarState();
}

class _HomeappbarState extends State<Homeappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Icon(Icons.sort, size: 30),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "DP Shop",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                   color: Color(0xFF4C53A5)
                ),
              ),
            ),
            Spacer(),
            InkWell(
              // onTap: () {
              //   Navigator.pushNamed(
              //     context,
              //     "/cardpage",
              //   ); // Add "/" before "cardpage"
              //   print("Navigating to Card Page...");
              // },
                onTap: () {
              Get.toNamed("/cardpage"); // Correct navigation using GetX
              print("Navigating to Card Page...");
            },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: const Color.fromARGB(255, 102, 112, 120),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

