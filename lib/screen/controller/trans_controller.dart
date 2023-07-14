import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/transModel.dart';
import 'package:vicoba_app_final_year_project/screen/home/notification.dart';
import 'package:vicoba_app_final_year_project/services/transRepository.dart';

class transController extends GetxController{
  static transController get instance => Get.find();

  // TextField controllers to get data from TextFields
  TextEditingController _loanRequest = TextEditingController(text: 'Loan Request');
  TextEditingController _controllerID = TextEditingController();
  FocusNode id = FocusNode();
  TextEditingController _controllerAccNo = TextEditingController();
  FocusNode accNo = FocusNode();
  TextEditingController _controllerAmount = TextEditingController();
  FocusNode Amount = FocusNode();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPost = TextEditingController();
  TextEditingController _controllerStatus = TextEditingController();

  final transRepo = Get.put(transRepository());

  Future <void> createTransaction(transModel trans) async{
    await transRepo.createTransaction(trans);
    Get.to(() => notification());
  }

}