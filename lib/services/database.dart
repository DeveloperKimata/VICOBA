import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('USERS');

  Future<void> createUserData(String userID,
  String groupID,
  String userType,
  String userName,
  String password,
  String phoneNumber,
   String email) async{
    return await userCollection.doc(uid).set({
      'userID': userID,
      'groupID': groupID,
      'userType': userType,
      'userName': userName,
      'password': password,
      'phoneNumber': phoneNumber,
      'email': email,
    });
  }

}