
import 'package:bookingproject/controller/auth_controller.dart';
import 'package:bookingproject/screens/controller/navigatorcontroller.dart';
import 'package:bookingproject/screens/loginPage.dart';
import 'package:bookingproject/screens/loginSuceessPage.dart';
import 'package:bookingproject/screens/view/cardPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookingproject/screens/navigator/navigatorPage.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
    Get.put(AuthController());
    Get.put(NavigationController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),    
        GetPage(name: '/', page: () => Navigatorpage()), 
        GetPage(name: '/', page: () => Cardpage()),
        GetPage(name: '/', page: () => LoginSuccessPage()),
      ],
    ),
  );
}
