
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


