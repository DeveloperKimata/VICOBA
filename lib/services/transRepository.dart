import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/transModel.dart';

class transRepository extends GetxController{
  static transRepository get instance => Get.find();

  final _db =FirebaseFirestore.instance;

  ///store user in Firestore
  createTransaction(transModel trans) async{
    await _db.collection("TRANSACTIONS").add(trans.toJson()).whenComplete(
          () => Get.snackbar("Congrats","Your confirmations has sent successfully.",
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

  Future<transModel> getTransDetails(String email) async{
    final snapshot = await _db.collection('TRANSACTIONS').where("email", isEqualTo: email).get();
    final transData = snapshot.docs.map((e) => transModel.fromSnapshot(e)).single;
    return transData;
  }

  Future<List<transModel>> allTrans() async{
    final snapshot = await _db.collection('TRANSACTIONS').get();
    final transData = snapshot.docs.map((e) => transModel.fromSnapshot(e)).toList();
    return transData;
  }


}