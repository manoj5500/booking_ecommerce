// import 'package:bookingproject/controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// // import '../controllers/auth_controller.dart';

// class OtpVerificationPage extends StatefulWidget {
//   final String phone;

//   OtpVerificationPage({required this.phone});

//   @override
//   State<OtpVerificationPage> createState() => _OtpVerificationPageState();
// }

// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   final AuthController authController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("OTP Verification")),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Enter the OTP sent to ${widget.phone}"),
//             const SizedBox(height: 20),
//             OTPTextField(
//               length: 6,
//               width: MediaQuery.of(context).size.width,
//               fieldWidth: 40,
//               style: const TextStyle(fontSize: 17),
//               textFieldAlignment: MainAxisAlignment.spaceAround,
//               fieldStyle: FieldStyle.box,
//               onCompleted: (pin) {
//                 authController.verifyOtp(pin);
//               },
//             ),
//             const SizedBox(height: 20),
//             Obx(() => authController.isLoading.value
//                 ? const CircularProgressIndicator()
//                 : const SizedBox.shrink()),
//           ],
//         ),
//       ),
//     );
//   }
// }
