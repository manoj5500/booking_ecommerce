

import 'package:bookingproject/screens/view/localservice/favourstorage.dart';
import 'package:flutter/material.dart';

class StoredDataPage extends StatefulWidget {
  @override
  _StoredDataPageState createState() => _StoredDataPageState();
}

class _StoredDataPageState extends State<StoredDataPage> {
  List<dynamic> storedItems = [];

  @override
  void initState() {
    super.initState();
    loadStoredItems();
  }

  void loadStoredItems() async {
    List<dynamic> items = await FavoriteStorage.getStoredItems();
    setState(() {
      storedItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(color: Color(0xFF4C53A5), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: storedItems.isNotEmpty
          ? ListView.builder(
              itemCount: storedItems.length,
              itemBuilder: (context, index) {
                final item = storedItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Image.asset(
                            item["image"],
                            width: 50,
                            height: 50,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 14,top: 2),
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                          padding: const EdgeInsets.only(left: 14,top: 4),
                            child: Text("\$${item["price"]}"),
                          ),
                        ),
                        SizedBox(height: 10),

                        
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Text(
                                "Size: ",
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              Text(
                                "${item["size"]}",
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                    
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(

                            children: [
                              Text(
                                "Color: ",
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              Text(
                                item["colors"],
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              Spacer(), 
                              Text(
                          "Booking Confirmed",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No stored items yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
