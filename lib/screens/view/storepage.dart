
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
        title: Text("Stored Favorites",style: TextStyle(color:  Color(0xFF4C53A5),fontWeight: FontWeight.bold),),
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
                  child: ListTile(
                    leading: Image.asset(
                      item["image"],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      item["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("\$${item["price"]}"),
                    
                    
                    trailing: Text(
                      "Booking Confirmed",
                      style: TextStyle(
                        color: Colors.green, // Text color
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 14, // Font size
                      ),
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
