// import 'package:bookingproject/customWidget/cardWidget/itemappBar.dart';
// import 'package:bookingproject/screens/view/cardPage.dart';
// import 'package:bookingproject/screens/view/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bookingproject/controller/auth_controller.dart';
// // import 'package:bookingproject/screens/loginPage.dart';

// void main() {
//   Get.put(AuthController()); // Initialize GetX Controller
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor:Colors.white, 
//       ),
//      home: const HomePage(), // Start with HomePage
//       routes: {
//         "/home": (context) => const HomePage(), 
//         "/cardpage": (context) => const Cardpage(), 
//          "/itemappbar": (context) => const Itemappbar(),
//       },
//     );
//   }
// }

// import 'package:bookingproject/screens/loginPage.dart';
// import 'package:bookingproject/screens/view/cardPage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bookingproject/screens/navigator/navigatorPage.dart';
// import 'package:get_storage/get_storage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();  
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/', // Set HomePage as the initial screen
//       getPages: [
//       GetPage(name: '/', page: () => LoginPage()),    
//         GetPage(name: '/naviga', page: () => Navigatorpage()), // Initial NavigatorPage
//         GetPage(name: '/cardpage', page: () => Cardpage()),
//       ],
//       home: LoginPage(), // Start with Navigatorpage
//     ),
//   );
// }




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
      initialRoute: '/',  // Default initial route, can be set to '/login' if needed
      getPages: [
        // GetPage(name: '/', page: () => LoginPage()),    
        GetPage(name: '/', page: () => Navigatorpage()), 
        GetPage(name: '/', page: () => Cardpage()),
        GetPage(name: '/', page: () => LoginSuccessPage()),
      ],
    ),
  );
}
