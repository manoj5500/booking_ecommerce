import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedItem = 0.obs; // Observable variable to track selected item

  void setSelectedItem(int index) {
    selectedItem.value = index;
  }
}
