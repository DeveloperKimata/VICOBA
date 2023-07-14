import 'package:cloud_firestore/cloud_firestore.dart';

class groupModel{
  final String? id;
  final String? name;
  final String? created_by;

  groupModel({
    this.id,
    this.name,
    this.created_by
  });

  toJson(){
    return{
      'name': name,
      'created_by': created_by,
    };
  }

  /// step 1 - map user fetched from Firebase to groupModel

  factory groupModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return groupModel(
      id: document.id,
      name: data['name'],
      created_by: data['created_by'],
    );
  }
}

