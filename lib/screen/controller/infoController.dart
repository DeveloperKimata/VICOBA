
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/services/loansRepository.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class infoController extends GetxController{
  static infoController get instance => Get.find();

  //repository
  final _authRepo = Get.put(AuthRepository());
  final _userRepo = Get.put(userRepository());
  final _loanRepo = Get.put(loanRepository());

  ///step 3 - Get user email and pass to userRepository to fetch user record.

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar('email', 'Login to continue');
    }
  }

  ///fetch list of loan records
  Future <List<userModel>> getAllUser() async => await _userRepo.allUser();

  Future<loanModel> getLoanData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _loanRepo.getloanDetails(email);
    }else{
      Get.snackbar('email', 'Login to continue');
    }
    throw Exception('user email is null');
  }

  ///fetch list of loan records
  Future <List<loanModel>> getAllLoan() async => await _loanRepo.allLoans();

  updateRecord(userModel user) async{
    await _userRepo.updateUserRecord(user);
  }

}