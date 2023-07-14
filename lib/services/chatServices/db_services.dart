import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});

  //reference for out collections
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("USERS");
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection("GROUPS");
  //update the userData
Future updateUserData(String email, String password, String memberID, String groupName, String userType, String userName, String phoneNumber) async{
return await userCollection.doc(uid).set({
  'memberID':memberID,
  'groupID':groupName,
  'userType':userType,
  'userName': userName,
  'password': password,
  'phoneNumber': phoneNumber,
  'profilePhoto': "",
  'email':email,
  'uid':uid,
});
}
}