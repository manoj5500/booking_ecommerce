

import 'package:bookingproject/screens/view/favoritePage.dart';
import 'package:bookingproject/screens/view/homepage.dart';
import 'package:bookingproject/screens/view/localservice/localstorageserivce.dart';
import 'package:bookingproject/screens/view/storepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'local_storage_service.dart';

class NavigationController extends GetxController {   
  var selectedIndex = 0.obs;

  final List<Map<String, dynamic>> items = [
    {"image": "images/1.png", "title": "slippers for women", "description": "Description of Product 1", "price": 55,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},
    {"image": "images/2.png", "title": "Watch", "description": "Description of Product 2", "price": 60,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time."},
    {"image": "images/3.png", "title": "Men Sling Bag", "description": "Description of Product 3", "price": 45,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},    
    {"image": "images/4.png", "title": "Travel Bag", "description": "Description of Product 4", "price": 70,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},
    {"image": "images/5.png", "title": "Women Sling Bag", "description": "Description of Product 5", "price": 50,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},
    {"image": "images/6.png", "title": " Sliders slippers", "description": "Description of Product 6", "price": 65,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},
    {"image": "images/7.png", "title": "fastrack watch", "description": "Description of Product 7", "price": 75,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.",},
  ];

  // var favoriteItems = <int>{}.obs; // Reactive set for favorite items

  // final List<Widget> pages = [];

  RxList<int> favoriteItems = <int>[].obs;
  final List<Widget> pages = [];

  @override
  void onInit() {
    super.onInit();

    // Load favorites from local storage
    loadFavoritesFromStorage();

    pages.addAll([
      
      HomePage(),
      FavoritesiconPage(),
      StoredDataPage(),
      Scaffold(body: Center(child: Text("Shopping Cart"))),
    ]);
  }

  // Load favorites from local storage
  void loadFavoritesFromStorage() async {
    favoriteItems.value = await LocalStorageService.loadFavorites();
  }

  // Save favorites to local storage
  void saveFavoritesToStorage() {
    LocalStorageService.saveFavorites(favoriteItems.value);
  }

  // Add or remove from favorites and update local storage
  void toggleFavorite(int index) {
    if (favoriteItems.contains(index)) {
      favoriteItems.remove(index);
    } else {
      favoriteItems.add(index);
    }

    // Save the updated favorites to local storage
    saveFavoritesToStorage();
  }

  // Change page index
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
