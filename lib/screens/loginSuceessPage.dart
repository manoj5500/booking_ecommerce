import 'package:bookingproject/screens/navigator/navigatorPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSuccessPage extends StatefulWidget {
  const LoginSuccessPage({super.key});

  @override
  _LoginSuccessPageState createState() => _LoginSuccessPageState();
}

class _LoginSuccessPageState extends State<LoginSuccessPage> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 2), () {
      
      Get.back();
      Get.to(
        () => Navigatorpage(),
      ); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle, 
              size: 80.0, // Green color
            ),
            const SizedBox(height: 20),
            const Text(
              "Login Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
