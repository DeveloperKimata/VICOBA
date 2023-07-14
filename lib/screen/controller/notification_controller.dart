import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/services/loansRepository.dart';

class notificationController extends GetxController{
  static notificationController get instance => Get.find();

  //repository
  final _authRepo = Get.put(AuthRepository());
  final _loanRepo = Get.put(loanRepository());

  ///step 3 - Get user email and pass to userRepository to fetch user record.

  getLoanData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _loanRepo.getloanDetails(email);
    }else{
      Get.snackbar('email', 'Login to continue');
    }
  }

  ///fetch list of user records
  Future <List<loanModel>> getAllLoan() async => await _loanRepo.allLoans();


}