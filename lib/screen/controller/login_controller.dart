import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final groupID = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();


  Future <void> loginUser(String email, String password) async{
    String ? error = await AuthRepository.instance.loginWithEmailAndPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  void phoneAuthentication(String phoneNumber){
    AuthRepository.instance.phoneAuthentication(phoneNumber);
  }

}