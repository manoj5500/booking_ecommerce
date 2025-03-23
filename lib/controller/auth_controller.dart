import 'package:bookingproject/screens/loginSuceessPage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isOtpSent = false.obs; // Flag to indicate if OTP was sent
  var otp = ''.obs; // Store OTP for verification
  var email = ''.obs;

  // Simulated Login Authentication
  Future<void> login(String email, String password) async {
    isLoading(true);
    // await Future.delayed(const Duration(seconds: 5)); // Simulating API Call

    if (email.isNotEmpty && password.isNotEmpty) {
      // Simulate OTP sending
      isOtpSent(true); // OTP is "sent" after login
      this.email(email); // Store email for OTP verification
      generateOtp(); // Generate OTP for testing purposes
      Get.snackbar("Info", "OTP has been sent to $email");
    } else {
      Get.snackbar("Error", "Please enter both email and password");
      isOtpSent(false); // If login fails, OTP is not sent
    }
    isLoading(false);
  }

  // Simulate OTP generation
  void generateOtp() {
    otp('123456'); // Hardcoded OTP for testing
  }

  // OTP Verification (add your logic here)
  Future<void> verifyOtp(String enteredOtp) async {
    isLoading(true);
    // await Future.delayed(const Duration(seconds: 2)); // Simulating API Call

    if (enteredOtp == otp.value) {
      // OTP is correct, redirect to success page
      Get.offAll(() => const LoginSuccessPage());
    } else {
      // Invalid OTP, show error message
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    }
    isLoading(false);
  }
}
