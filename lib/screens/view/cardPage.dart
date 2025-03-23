

import 'package:bookingproject/customWidget/cardWidget/cardAppBar.dart';
import 'package:bookingproject/customWidget/cardWidget/cartBottomNavBar.dart';
import 'package:bookingproject/customWidget/cardWidget/cartItemSamples.dart';
import 'package:flutter/material.dart';

class Cardpage extends StatefulWidget {
  const Cardpage({super.key});

  @override
  State<Cardpage> createState() => _CardpageState();
}

class _CardpageState extends State<Cardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Cardappbar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
             color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Cartitemsamples(), 
                
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
