import 'package:bookingproject/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  static const String _key = 'orders';

  static Future<void> saveOrder(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> orders = prefs.getStringList(_key) ?? [];
    orders.add(jsonEncode(product.toJson()));
    await prefs.setStringList(_key, orders);
  }

  static Future<List<Product>> getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> orders = prefs.getStringList(_key) ?? [];
    return orders.map((e) => Product.fromJson(jsonDecode(e))).toList();
  }
}
