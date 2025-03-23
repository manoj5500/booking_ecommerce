

import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
                Text(
                  "\$250",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 1,),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Check Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

