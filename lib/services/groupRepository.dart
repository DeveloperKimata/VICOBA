import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/groupModel.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class groupRepository extends GetxController{
  static groupRepository get instance => Get.find();

  final _db =FirebaseFirestore.instance;

  final userRepo = Get.put(userRepository());
  ///store group in Firestore
  createGroup(groupModel group) async{
    await _db.collection("groups").add(group.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your group has been created.",
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

  ///step 2 - fetch all groups or group details

  Future<groupModel> getGroupInfo(String created_by) async{
    final snapshot = await _db.collection('groups').where("created_by", isEqualTo: created_by).get();
    final groupData = snapshot.docs.map((e) => groupModel.fromSnapshot(e)).single;
    return groupData;
  }

  Future<List<groupModel>> allGroups() async{
    final snapshot = await _db.collection('groups').get();
    final groupData = snapshot.docs.map((e) => groupModel.fromSnapshot(e)).toList();
    return groupData;
  }

  Future <void> updateGroupInfo(groupModel group) async{
    await _db.collection('groups').doc(group.id).update(group.toJson());
  }

}