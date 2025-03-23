
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookingproject/controller/auth_controller.dart';
import 'package:bookingproject/screens/loginOtpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find();
  bool _isPasswordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C53A5),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                // Login Form
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // Email Field
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 15),

                      // Password Field
                      TextField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible, 
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; 
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                     
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password?"),
                        ),
                      ),


                      Obx(
                        () =>
                            authController.isLoading.value
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[900],
                                    ),
                                    onPressed: () {
                                      String email =
                                          emailController.text.trim();
                                      String password =
                                          passwordController.text.trim();
                                      if (email.isEmpty) {
                                        Get.snackbar(
                                          "Error",
                                          "Email cannot be empty",
                                        );
                                        return;
                                      } else if (password.isEmpty) {
                                        Get.snackbar(
                                          "Error",
                                          "Password cannot be empty",
                                        );
                                        return;
                                      }

                                      
                                      authController.login(email, password);

                                      
                                      if (authController.isOtpSent.value) {
                                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OtpPage(),
                                          ),
                                        );
                                      } else {
                                       
                                        Get.snackbar(
                                          "Error",
                                          "Failed to send OTP. Try again.",
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                      ),
                      SizedBox(height: 15),

                      
                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text("or continue with"),
                          ),
                          Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                      SizedBox(height: 15),

                      // Register Link
                      TextButton(
                        onPressed: () {},
                        child: Text("Don't have an account? Register for free"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
