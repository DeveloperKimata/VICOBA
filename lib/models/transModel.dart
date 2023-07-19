import 'package:cloud_firestore/cloud_firestore.dart';

class transModel{
  final String? id;
  final String? Amount;
  final String? AccNo;
  final String? groupName;
  final String? selectedItem;


  transModel({this.id, this.Amount, this.AccNo, this.groupName, this.selectedItem});


  toJson(){
    return {
      //key and value
      'id':id,
      'Amount':Amount,
      'AccNo':AccNo,
      'groupName':groupName,
      'loanStatus':selectedItem
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

  factory transModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return transModel(
      id:document.id,
      Amount: data['Amount'],
      AccNo: data['AccNo'],
      groupName: data['groupName'],
      selectedItem: data['selectedItem'],
    );
  }
}