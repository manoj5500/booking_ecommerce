
import 'package:bookingproject/customWidget/itemDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookingproject/screens/controller/navigatorcontroller.dart';

class FavoritesiconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find(); // Get controller instance

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(color: Color(0xFF4C53A5), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, 
      ),
      backgroundColor: Colors.grey[200],
      body: Obx(() {
        // Filter favorite items
        final favoriteList = navigationController.items
            .where((item) =>
                navigationController.favoriteItems.contains(navigationController.items.indexOf(item)))
            .toList();

        return favoriteList.isEmpty
            ? Center(child: Text("No favorites yet!"))
            : ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final item = favoriteList[index];
                  final itemIndex = navigationController.items.indexOf(item); // Get index

                  return InkWell( 
                    onTap: () {
                      Get.to(() => ItemDetailPage(item: item)); 
                      //  Get.offAll(() => ItemDetailPage(item: item)); 
                      
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),

                        
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(item["image"], width: 50, height: 50, fit: BoxFit.cover),
                        ),

                        title: Text(
                          item["title"],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),

                        subtitle: Text(
                          "\$${item["price"]}",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),

                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            navigationController.favoriteItems.remove(itemIndex);
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}



// import 'package:bookingproject/customWidget/itemDetailsScreen.dart';
// import 'package:bookingproject/screens/navigator/navigatorPage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bookingproject/screens/controller/navigatorcontroller.dart';
// // import 'package:bookingproject/screens/home_page.dart'; // Import Home Page

// class FavoritesiconPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final NavigationController navigationController = Get.find(); // Get controller instance

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Favorites",
//           style: TextStyle(color: Color(0xFF4C53A5), fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,

//         // ✅ Add Leading Arrow Icon to Navigate to Home Page
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFF4C53A5)),
//           onPressed: () {
//              Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Navigatorpage(),
//                     ),
//                   ); // ✅ Navigate to HomePage on click
//           },
//         ),
//       ),
//       backgroundColor: Colors.grey[200],
//       body: Obx(() {
//         // Filter favorite items
//         final favoriteList = navigationController.items
//             .where((item) =>
//                 navigationController.favoriteItems.contains(navigationController.items.indexOf(item)))
//             .toList();

//         return favoriteList.isEmpty
//             ? Center(child: Text("No favorites yet!"))
//             : ListView.builder(
//                 itemCount: favoriteList.length,
//                 itemBuilder: (context, index) {
//                   final item = favoriteList[index];
//                   final itemIndex = navigationController.items.indexOf(item); // Get index

//                   return InkWell(
//                     onTap: () {
//                       Get.to(() => ItemDetailPage(item: item));
//                     },
//                     child: Card(
//                       elevation: 5,
//                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(10),

//                         leading: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(item["image"], width: 50, height: 50, fit: BoxFit.cover),
//                         ),

//                         title: Text(
//                           item["title"],
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),

//                         subtitle: Text(
//                           "\$${item["price"]}",
//                           style: TextStyle(fontSize: 14, color: Colors.black87),
//                         ),

//                         trailing: IconButton(
//                           icon: Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             navigationController.favoriteItems.remove(itemIndex);
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//       }),
//     );
//   }
// }
