import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/updateProfile.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class profileController extends GetxController{
  static profileController get instance => Get.find();

  //repository
  final _authRepo = Get.put(AuthRepository());
  final _userRepo = Get.put(userRepository());

  ///step 3 - Get user email and pass to userRepository to fetch user record.

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar('email', 'Login to continue');
    }
  }

  ///fetch list of user records
  Future <List<userModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(userModel user) async{
    await _userRepo.updateUserRecord(user);
  }

}