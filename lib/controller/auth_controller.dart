import 'package:bookingproject/screens/loginSuceessPage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isOtpSent = false.obs; 
  var otp = ''.obs; 
  var email = ''.obs;

  
  Future<void> login(String email, String password) async {
    isLoading(true);
   

    if (email.isNotEmpty && password.isNotEmpty) {
     
      isOtpSent(true); 
      this.email(email); 
      generateOtp(); 
      Get.snackbar("Info", "OTP has been sent to $email");
    } else {
      Get.snackbar("Error", "Please enter both email and password");
      isOtpSent(false); 
    }
    isLoading(false);
  }

  
  void generateOtp() {
    otp('123456'); 
  }

  
  Future<void> verifyOtp(String enteredOtp) async {
    isLoading(true);
    
    if (enteredOtp == otp.value) {
      
      Get.offAll(() => const LoginSuccessPage());
    } else {
      
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    }
    isLoading(false);
  }
}
