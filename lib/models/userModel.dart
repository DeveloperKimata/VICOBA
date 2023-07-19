

import 'package:cloud_firestore/cloud_firestore.dart';

class userModel{
  final String? userID;
  final String? memberID;
  final String? groupName;
  final String? userType;
  final String? userName;
  final String? password;
  final String? phoneNumber;
  final String? email;

  userModel({
    this.userID,
     this.memberID,
     this.groupName,
     this.userType,
    required this.userName,
    required this.password,
    required this.phoneNumber,
    required this.email,
  });
  toJson(){
    return {
      //key and value
      'memberID':memberID,
      'groupID':groupName,
      'userType':userType,
      'userName': userName,
      'password': password,
      'phoneNumber': phoneNumber,
      'email':email,
    };
  }


   factory userModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return userModel(
        userID: document.id,
      memberID: data['memberID'],
        groupName: data['groupName'],
        userType: data['userType'],
        userName: data['userName'],
        password: data['password'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
    );
   }
}