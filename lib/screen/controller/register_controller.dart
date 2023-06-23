import 'package:flutter/material.dart';
import 'package:get/get.dart';

class registerController extends GetxController{
  static registerController get instance => Get.find();

  // TextField controllers to get data from TextFields
  final groupID = TextEditingController();
  final groupName = TextEditingController();
  final  createdBy = TextEditingController();




}