
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStorage {
  static const String _key = 'favorites';

  // Save selected item
  static Future<void> saveSelectedItem(Map<String, dynamic> item) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> storedItems = prefs.getStringList(_key) ?? [];

    // Convert item to JSON string
    storedItems.add(jsonEncode(item));
    await prefs.setStringList(_key, storedItems);
  }

  // Get stored items
  static Future<List<Map<String, dynamic>>> getStoredItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> storedItems = prefs.getStringList(_key) ?? [];

    // Convert JSON strings back to Map
    return storedItems
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }
}