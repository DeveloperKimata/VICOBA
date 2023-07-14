import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/groupModel.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/loginPage.dart';
import 'package:vicoba_app_final_year_project/services/groupRepository.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class registerController extends GetxController{
  static registerController get instance => Get.find();

  // TextField controllers to get data from TextFields
  final groupID = TextEditingController();
  final name = TextEditingController();
  final  createdBy = TextEditingController();

  final groupRepo = Get.put(groupRepository());
  final userRepo = Get.put(userRepository());

  //call this Function from design and it will do the rest
  // void registerUser(String email, String password){
  //   String ? error = AuthRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
  //   if(error != null){
  //
  //     Get.showSnackbar(GetSnackBar(message: error.toString()));
  //   }
  // }

  Future <void> createGroup(groupModel group) async{
    await groupRepo.createGroup(group);
    Get.to(() => loginPage());
  }


}