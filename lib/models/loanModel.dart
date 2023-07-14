import 'package:cloud_firestore/cloud_firestore.dart';

class loanModel{
  final String? requestStatement = 'Loan Request';
  final String? id;
  final String? Amount;
  final String? statement;

  loanModel({
    required this.id,
    required this.Amount,
    required this.statement,
  });
  toJson(){
    return {
      //key and value
      'id':id,
      'Amount':Amount,
      'statement':statement,
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

  factory loanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return loanModel(
      id: data['id'],
      Amount: data['Amount'],
      statement: data['statement'],
    );
  }
}