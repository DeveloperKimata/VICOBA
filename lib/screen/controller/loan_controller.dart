import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/services/loansRepository.dart';

class loanController extends GetxController{
  static loanController get instance => Get.find();

  // TextField controllers to get data from TextFields
  TextEditingController _loanRequest = TextEditingController(
      text: 'Loan Request');
  final controllerID = TextEditingController();
  FocusNode id = FocusNode();
  final controllerAmount = TextEditingController();
  FocusNode Amount = FocusNode();
  final controllerStatement = TextEditingController();

  final loanRepo = Get.put(loanRepository());

  Future <void> createLoan(loanModel loan) async{
    await loanRepo.createLoan(loan);
    Get.to(() => Bottom());
  }

}