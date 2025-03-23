import 'package:bookingproject/model/localstorage.dart';
import 'package:bookingproject/model/model.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Product> orders = [];

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  void loadOrders() async {
    List<Product> savedOrders = await LocalStorage.getOrders();
    setState(() {
      orders = savedOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          Product product = orders[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
          );
        },
      ),
    );
  }
}
