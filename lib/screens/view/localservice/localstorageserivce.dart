// import 'package:shared_preferences/shared_preferences.dart';

// class LocalStorageService {
//   // Store favorite items in SharedPreferences
//   static Future<void> saveFavorites(Set<int> favoriteItems) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<int> favoriteList = favoriteItems.toList();
//     await prefs.setStringList('favorite_items', favoriteList.map((e) => e.toString()).toList());
//   }

//   // Load favorite items from SharedPreferences
//   static Future<Set<int>> loadFavorites() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? favoriteList = prefs.getStringList('favorite_items');
//     if (favoriteList != null) {
//       return favoriteList.map((e) => int.parse(e)).toSet();
//     } else {
//       return {};
//     }
//   }

//   // Remove all favorite items from SharedPreferences
//   static Future<void> removeFavorites() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('favorite_items');
//   }
// }

//oooooooooooo
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Load favorites from local storage
  static Future<List<int>> loadFavorites() async {
    String? storedFavorites = await _storage.read(key: 'favorites');
    if (storedFavorites == null) {
      return []; // Return empty list if no favorites are saved
    }
    List<dynamic> favoritesList = jsonDecode(storedFavorites);
    return favoritesList.map((e) => e as int).toList();
  }

  // Save favorites to local storage
  static Future<void> saveFavorites(List<int> favorites) async {
    String encodedFavorites = jsonEncode(favorites);
    await _storage.write(key: 'favorites', value: encodedFavorites);
  }
}


