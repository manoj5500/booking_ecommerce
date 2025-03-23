
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookingproject/controller/auth_controller.dart';

class   OtpPage extends StatelessWidget {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF4C53A5),
    // backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card box with "Enter OTP" text and OTP input fields
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Enter OTP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 20),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 40,
                          child: TextField(
                            controller: otpControllers[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: "", // To hide the counter
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus(); 
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus(); 
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                          width: double.infinity,
                                  height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                      ),
                              onPressed: () {
                                String enteredOtp = otpControllers.map((controller) => controller.text).join();
                                authController.verifyOtp(enteredOtp); 
                              },
                              child: const Text("Verify OTP",style: TextStyle(color: Colors.white),),
                            ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
