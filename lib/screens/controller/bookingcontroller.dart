import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedItem = 0.obs; 
  void setSelectedItem(int index) {
    selectedItem.value = index;
  }
}
