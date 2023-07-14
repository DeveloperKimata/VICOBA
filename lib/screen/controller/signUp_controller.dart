import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/Payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class signUpController extends GetxController{
  static signUpController get instance => Get.find();

  // TextField controllers to get data from TextFields
  final memberID = TextEditingController();
  final groupName = TextEditingController();
  final userType = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();

  final userRepo = Get.put(userRepository());

  //call this Function from design and it will do the rest
  void registerUser(String email, String password){
    String ? error = AuthRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null){

      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  //get 4n# from user and pass it to Auth repository for firebase authentication
  void phoneAuthentication(String phoneNumber){
    AuthRepository.instance.phoneAuthentication(phoneNumber);
  }

  Future <void> createUser(userModel user) async{
   await userRepo.createUser(user);
    phoneAuthentication(user.phoneNumber!);
   Get.to(() => Bottom());
  }

}