import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/transModel.dart';
import 'package:vicoba_app_final_year_project/screen/home/notification.dart';
import 'package:vicoba_app_final_year_project/services/transRepository.dart';

class transController extends GetxController{
  static transController get instance => Get.find();

  // TextField controllers to get data from TextFields
  final Amount = TextEditingController();
  final AccNo = TextEditingController();
  final selectedItem = TextEditingController();
  final groupName = TextEditingController();

  final transRepo = Get.put(transRepository());

  Future <void> createTransaction(transModel trans) async{
    await transRepo.createTransaction(trans);
   // Get.to(() => notification(reportType: widget.reportType, reportText: widget.reportText,));
  }

}