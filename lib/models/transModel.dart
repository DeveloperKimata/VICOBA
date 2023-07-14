import 'package:cloud_firestore/cloud_firestore.dart';

class transModel{
  final String? requestStatement = 'Loan Request';
  final String? id;
  final String? Amount;
  final String? AccNo;
  final String? Name;
  final String? statement;

  transModel({
    required this.id,
    required this.Amount,
    required this.AccNo,
    required this.Name,
    required this.statement,
  });
  toJson(){
    return {
      //key and value
      'id':id,
      'Amount':Amount,
      'AccNo':AccNo,
      'Name':Name,
      'statement':statement,
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

  factory transModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return transModel(
      id: data['id'],
      Amount: data['Amount'],
      AccNo: data['AccNo'],
      Name: data['Name'],
      statement: data['statement'],
    );
  }
}