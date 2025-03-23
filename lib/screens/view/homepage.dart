
import 'package:bookingproject/customWidget/categorieswidget.dart';
import 'package:bookingproject/customWidget/homeappbar.dart';
import 'package:bookingproject/customWidget/itemsWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Homeappbar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Darker grey shade
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF4C53A5),),
                  ),
                ),
                Categorieswidget(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF4C53A5),),
                  ),
                ),
                Itemswidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
