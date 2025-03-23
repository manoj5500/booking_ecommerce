
import 'package:bookingproject/main.dart';
import 'package:bookingproject/screens/navigator/navigatorPage.dart';
import 'package:bookingproject/screens/view/homepage.dart';
import 'package:bookingproject/screens/view/localservice/favourstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = Get.arguments ?? {}; // Handle null safely

    return Scaffold(
      backgroundColor:   Colors.grey[200],
      appBar: AppBar(
        title: Text("Favorites",style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xFF4C53A5)),),
        backgroundColor: Colors.white,
      ),
      body:
          item.isNotEmpty
              ? Center(
                child: Container(
                  width: 300,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    margin: EdgeInsets.all(20),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item["image"], height: 200, width: 200),
                          Text(
                            item["title"],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${item["price"]}",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item["description"],
                              textAlign: TextAlign.center,
                            ),
                          ),

                          // Confirm Button
                          ElevatedButton.icon(
                            onPressed: () async {
                              await FavoriteStorage.saveSelectedItem(item);

                              Get.defaultDialog(
                                title: "Booking Confirmed",
                                middleText:
                                    "Your booking has been successfully confirmed!",
                                barrierDismissible: false,
                              );

                              Future.delayed(Duration(seconds: 2), () {
                                Get.back();
                                Get.to(
                                  () => Navigatorpage(),
                                ); // Navigate to stored data page
                              });
                            },
                            icon: Icon(CupertinoIcons.cart_badge_plus,color: Colors.white),
                            label: Text("Confirm",style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                0xFF4C53A5,
                              ), // Button background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ), // Optional: Rounded corners
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ), // Optional: Button padding
                            ),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton.icon(
                            onPressed: () async {
                              // await FavoriteStorage.saveSelectedItem(item);

                              // Get.defaultDialog(
                              //   title: "Booking Confirmed",
                              //   middleText: "Your booking has been successfully confirmed!",
                              //   barrierDismissible: false,
                              // );

                              // Future.delayed(Duration(seconds: 2), () {
                              Get.back();
                              Get.to(
                                () => Navigatorpage(),
                              ); // Navigate to stored data page
                              // });
                            },

                            icon: Icon(CupertinoIcons.clear,color: Colors.white,),
                            label: Text("Cancel",style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                0xFF4C53A5,
                              ), // Button background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ), // Optional: Rounded corners
                              padding: EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 20,
                              ), // Optional: Button padding
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              : Center(
                child: Text(
                  "No favorite item selected!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
    );
  }
}
