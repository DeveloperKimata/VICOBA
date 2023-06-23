// class user{
//
//   final String uid;
//
//   user({required this.uid});
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class paymentModel{
   String? userID;
   String? paymentType;
   String? paymentAmount;
   String? paymentStatus;
   String? totalBalance;
   DateTime? transactionDate;

   paymentModel({this.userID, this.paymentType, this.paymentAmount,
       this.paymentStatus, this.transactionDate, this.totalBalance});

  toJson(){
    return {
      //key and value
      'userID':userID,
      'paymentType':paymentType,
      'paymentAmount':paymentAmount,
      'paymentStatus': paymentStatus,
      'transactionDate': transactionDate,
      'totalBalance': totalBalance,
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

  // factory paymentModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   final data = document.data()!;
  //   return paymentModel(
  //     userID: data['userID'],
  //     groupID: data['groupID'],
  //     userType: data['userType'],
  //     userName: data['userName'],
  //     password: data['password'],
  //     phoneNumber: data['phoneNumber'],
  //     email: data['email'],
  //   );
  // }


}