import 'package:cloud_firestore/cloud_firestore.dart';

class loanModel{
  final String? loanRequest;
  final String? id;
  final String? controllerAmount;
  final String? controllerStatement;

  loanModel({
    required this.loanRequest,
    required this.id,
    required this.controllerAmount,
    required this.controllerStatement,
  });
  toJson(){
    return {
      //key and value
      'requestStatement':loanRequest,
      'controllerAmount':controllerAmount,
      'controllerstatement':controllerStatement,
    };
  }

  /// step 1 - map user fetched from Firebase to userModel

  factory loanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return loanModel(
      id: document.id,
      loanRequest:data['loanRequest'],
      controllerAmount: data['controllerAmount'],
      controllerStatement: data['controllerStatement'],
    );
  }
}