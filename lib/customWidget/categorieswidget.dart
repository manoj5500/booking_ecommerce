import 'package:flutter/material.dart';

class Categorieswidget extends StatefulWidget {
  const Categorieswidget({super.key});

  @override
  State<Categorieswidget> createState() => _CategorieswidgetState();
}

class _CategorieswidgetState extends State<Categorieswidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=1 ;i<8;i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/$i.png",width: 40,height: 40,),
                  Text("Sandal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),)
                ],
            ),
          ),
        ],
      ),
    );
  }
}