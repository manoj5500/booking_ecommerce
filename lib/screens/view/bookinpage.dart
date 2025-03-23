

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = Get.arguments ?? {}; 

    return Scaffold(
      appBar: AppBar(title: Text("Favorites"), backgroundColor: Color(0xFF4C53A5)),
      body: item.isNotEmpty
          ? Center(
              child: Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"], height: 200, width: 200),
                        Text(item["title"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("\$${item["price"]}", style: TextStyle(fontSize: 20, color: Colors.blue)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item["description"], textAlign: TextAlign.center),
                        ),

                        
                        ElevatedButton.icon(
                          onPressed: () async {
                           
                            Get.defaultDialog(
                              title: "Booking Confirmed",
                              middleText: "Your booking has been successfully confirmed!",
                              barrierDismissible: false,
                            );
                            Future.delayed(Duration(seconds: 2), () {
                              Get.back();
                              
                            });
                          },
                          icon: Icon(CupertinoIcons.cart_badge_plus),
                          label: Text("Confirm"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(child: Text("No favorite item selected!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}