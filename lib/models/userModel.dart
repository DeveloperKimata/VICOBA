// class user{
//
//   final String uid;
//
//   user({required this.uid});
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class userModel{
  final String? userID;
  final String? groupID;
  final String? userType;
  final String? userName;
  final String? password;
  final String? phoneNumber;
  final String? email;

  userModel({
      this.userID,
      this.groupID,
      this.userType,
      this.userName,
      this.password,
      this.phoneNumber,
      this.email,
  });
  toJson(){
    return {
      //key and value
      'userID':userID,
      'groupID':groupID,
      'userType':userType,
      'userName': userName,
      'password': password,
      'phoneNumber': phoneNumber,
      'email':email,
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

   factory userModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return userModel(
        userID: document.id,
        groupID: data['groupID'],
        userType: data['userType'],
        userName: data['userName'],
        password: data['password'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
    );
   }
}