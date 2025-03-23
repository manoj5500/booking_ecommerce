import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cartitemsamples extends StatefulWidget {
  const   Cartitemsamples({super.key});

  @override
  State<Cartitemsamples> createState() => _CartitemsamplesState();
}

class _CartitemsamplesState extends State<Cartitemsamples> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=1;i<4;i++)
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio(
                value: "",
                groupValue: "",
                activeColor: Color(0xFF4C53A5),
                onChanged: (index) {},
              ),
              Badge(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                    context,
                    "/itemappbar",
                  ); // Add "/" before "cardpage"
                  print("Navigating to  Page...");
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset("images/$i.png"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Title",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      Text(
                        "\$55",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
               
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(CupertinoIcons.plus, size: 18),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "01",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF4C53A5,
                              ), // Fix: Added parentheses around Color
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(CupertinoIcons.add, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}




// import 'package:bookingproject/customWidget/cardWidget/itemappBar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Ensure GetX is imported

// class Cartitemsamples extends StatefulWidget {
//   const Cartitemsamples({super.key});

//   @override
//   State<Cartitemsamples> createState() => _CartitemsamplesState();
// }

// class _CartitemsamplesState extends State<Cartitemsamples> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (int i = 1; i < 4; i++) 
//           Container(
//             height: 110,
//             margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Radio(
//                   value: "",
//                   groupValue: "",
//                   activeColor: Color(0xFF4C53A5),
//                   onChanged: (index) {},
//                 ),
//                  GestureDetector(
//                   onTap: () {
//                     // Using native navigation
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Itemappbar()), // Replace with your target page
//                     );
//                     print("Navigating to Itemappbar Page...");
//                   },
//                   child: Container(
//                     height: 70,
//                     width: 70,
//                     margin: EdgeInsets.only(right: 15),
//                     child: Image.asset("images/$i.png"), // Image path (make sure it's correct)
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Product Title",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF4C53A5),
//                           ),
//                         ),
//                         Text(
//                           "\$55",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF4C53A5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.delete, color: Colors.red),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 1,
//                                   blurRadius: 10,
//                                 ),
//                               ],
//                             ),
//                             child: Icon(CupertinoIcons.plus, size: 18),
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10),
//                             child: Text(
//                               "01",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF4C53A5),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 1,
//                                   blurRadius: 10,
//                                 ),
//                               ],
//                             ),
//                             child: Icon(CupertinoIcons.add, size: 18),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }
