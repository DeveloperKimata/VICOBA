import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/paymentModel.dart';

class paymentRepository extends GetxController{
  static paymentRepository get instance => Get.find();

  final _db =FirebaseFirestore.instance;

  ///store user in Firestore
  createPayment(paymentModel pay) async{
    await _db.collection("PAYMENTS").add(pay.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your payment has success.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green),
    )
        .catchError((error,stackTrace) {
      Get.snackbar("Error", "Something went wrong, try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());

    });
  }

  ///step 2 - fetch all users or user details

  // Future<paymentModel> getUserDetails(String email) async{
  //   final snapshot = await _db.collection('PAYMENTS').where("email", isEqualTo: email).get();
  //   final userData = snapshot.docs.map((e) => paymentModel.fromSnapshot(e)).single;
  //   return userData;
  // }
  //
  // Future<List<paymentModel>> allUser() async{
  //   final snapshot = await _db.collection('PAYMENTS').get();
  //   final userData = snapshot.docs.map((e) => paymentModel.fromSnapshot(e)).toList();
  //   return userData;
  // }
  //
  // Future <void> updateUserRecord(paymentModel user) async{
  //   await _db.collection('PAYMENTS').doc(user.userID).update(user.toJson());
  // }

}