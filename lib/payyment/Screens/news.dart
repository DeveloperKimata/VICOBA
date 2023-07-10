import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loans extends StatelessWidget {
  Loans(this.data,{Key? key}) : super(key: key){
    _documentReference =
        FirebaseFirestore.instance.collection('USERS').doc(data['userID']);

    _referenceReport = _documentReference?.collection('LOANS');

  }

  Map data;
  DocumentReference? _documentReference;
  CollectionReference? _referenceReport;

  TextEditingController _loanRequest=TextEditingController(text: 'Loan Request');
  TextEditingController _controllerID=TextEditingController();
  FocusNode userID = FocusNode();
  TextEditingController _controllerAmount=TextEditingController();
  FocusNode Amount = FocusNode();
  TextEditingController _controllerPost=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 80,
                        width: 80,
                        child:IconButton(
                          onPressed: (){
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Center(child: const Text('Loan Request',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,),),)
                  ],
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _loanRequest,
                  decoration: InputDecoration(
                    labelText: 'requestStatement',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'requestStatement',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerID,
                  decoration: InputDecoration(
                    labelText: 'userID',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'userID',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerAmount,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'Amount',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _controllerPost,
                  decoration: InputDecoration(
                    labelText: 'Statement',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'Statement',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange)),
                  ),
                ),
                SizedBox(height: 10),
               // showLoader?CircularProgressIndicator():
                ElevatedButton(onPressed: (){

                  Map<String,String> reportToAdd={
                    'requestStatement': 'Loan Request',
                    'userID': _controllerID.text,
                    'Amount': _controllerAmount.text,
                    'Statement': _controllerPost.text
                  };

                  //add post
                  _referenceReport?.add(reportToAdd);

                  //dismiss the bottom sheet
                  Navigator.of(context).pop();
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text('Submit',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold
                ),))
              ],
            ),
          ),
        )
    );
  }
}
