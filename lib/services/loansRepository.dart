import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';

class loanRepository extends GetxController{
  static loanRepository get instance => Get.find();

  final _db =FirebaseFirestore.instance;

  ///store user in Firestore
  createLoan(loanModel loan) async{
    await _db.collection('loans').add(loan.toJson()).whenComplete(
          () => Get.snackbar("Congrats","Your request has sent successfully.",
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

  Future<loanModel> getloanDetails(String email) async{
    final snapshot = await _db.collection('loans').where("email", isEqualTo: email).get();
    final loanData = snapshot.docs.map((e) => loanModel.fromSnapshot(e)).single;
    return loanData;
  }

  Future<List<loanModel>> allLoans() async{
    final snapshot = await _db.collection('loans').get();
    final loanData = snapshot.docs.map((e) => loanModel.fromSnapshot(e)).toList();
    return loanData;
  }


}