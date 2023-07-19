import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';

class userRepository extends GetxController{
  static userRepository get instance => Get.find();

  final _db =FirebaseFirestore.instance;

  ///store user in Firestore
  createUser(userModel user) async{
    await _db.collection("users").add(user.toJson()).whenComplete(
        () => Get.snackbar("Success", "Your account has been created.",
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

  Future<userModel> getUserDetails(String email) async{
    final snapshot = await _db.collection('users').where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => userModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<userModel>> allUser() async{
    final snapshot = await _db.collection('users').get();
    final userData = snapshot.docs.map((e) => userModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future <void> updateUserRecord(userModel user) async{
    await _db.collection('users').doc(user.userID).update(user.toJson());
  }

}