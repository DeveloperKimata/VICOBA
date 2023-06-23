import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/Payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otpController) async{
    var isVerified = await AuthRepository.instance.verifyOTP(otpController);
    isVerified ? Get.offAll(const Bottom()) : Get.back();
  }
}