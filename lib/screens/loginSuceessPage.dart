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
    // Delay navigation by 2 seconds and then navigate to NavigatorPage
    Future.delayed(const Duration(seconds: 2), () {
      // Get.off(() => Navigatorpage());
       Get.back();
                              Get.to(
                                () => Navigatorpage(),
                              ); // Navigate to NavigatorPage after 2 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Success")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle, // Green checkmark icon
              size: 80.0,
              color: Colors.green, // Green color
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
