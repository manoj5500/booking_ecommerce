

import 'package:bookingproject/screens/view/favoritePage.dart';
import 'package:bookingproject/screens/view/homepage.dart';
import 'package:bookingproject/screens/view/localservice/localstorageserivce.dart';
import 'package:bookingproject/screens/view/storepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavigationController extends GetxController {   
  var selectedIndex = 0.obs;

  final List<Map<String, dynamic>> items = [
    {"image": "images/1.png", "title": "slippers for women", "description": "Description of Product 1", "price": 55,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"Black"},
    {"image": "images/2.png", "title": "Watch", "description": "Description of Product 2", "price": 60,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"White"},
    {"image": "images/3.png", "title": "Men Sling Bag", "description": "Description of Product 3", "price": 45,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"grey"},    
    {"image": "images/4.png", "title": "Travel Bag", "description": "Description of Product 4", "price": 70,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"Black"},
    {"image": "images/5.png", "title": "Women Sling Bag", "description": "Description of Product 5", "price": 50,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"pink"},
    {"image": "images/6.png", "title": " Sliders slippers", "description": "Description of Product 6", "price": 65,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"Black"},
    {"image": "images/7.png", "title": "fastrack watch", "description": "Description of Product 7", "price": 75,"data": "As an Amazon-approved shipper, we pride ourselves on delivering top-notch shipping services that ensure your products reach customers efficiently and on time.","size":5,"colors":"brown"},
  ];



  RxList<int> favoriteItems = <int>[].obs;
  final List<Widget> pages = [];

  @override
  void onInit() {
    super.onInit();

    
    loadFavoritesFromStorage();

    pages.addAll([
      
      HomePage(),
      FavoritesiconPage(),
      StoredDataPage(),
      Scaffold(body: Center(child: Text("Shopping Cart"))),
    ]);
  }

  
  void loadFavoritesFromStorage() async {
    favoriteItems.value = await LocalStorageService.loadFavorites();
  }

  void saveFavoritesToStorage() {
    LocalStorageService.saveFavorites(favoriteItems.value);
  }

  void toggleFavorite(int index) {
    if (favoriteItems.contains(index)) {
      favoriteItems.remove(index);
    } else {
      favoriteItems.add(index);
    }

    
    saveFavoritesToStorage();
  }

  // Change page index
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
