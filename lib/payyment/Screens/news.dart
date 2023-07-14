import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/loan_controller.dart';

class Loans extends StatelessWidget {
  Loans({Key? key}) : super(key: key);
  TextEditingController _loanRequest = TextEditingController(
      text: 'Loan Request');
  TextEditingController _controllerID = TextEditingController();
  FocusNode id = FocusNode();
  TextEditingController _controllerAmount = TextEditingController();
  FocusNode Amount = FocusNode();
  TextEditingController _controllerPost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loanController());
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
                        child: IconButton(
                          onPressed: () {
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
                    labelStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'requestStatement',
                    hintStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerID,
                  decoration: InputDecoration(
                    labelText: 'id',
                    labelStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'id',
                    hintStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerAmount,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'Amount',
                    hintStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _controllerPost,
                  decoration: InputDecoration(
                    labelText: 'Statement',
                    labelStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'Statement',
                    hintStyle: TextStyle(
                        fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: Colors.orange)),
                  ),
                ),
                SizedBox(height: 10),
                // showLoader?CircularProgressIndicator():
                ElevatedButton(onPressed: () {
                  final loan = loanModel(
                    id: _controllerID.text.trim(),
                    Amount: _controllerAmount.text.trim(),
                    statement: _controllerPost.text.trim(),
                  );
                  loanController.instance.createLoan(loan);
                  _controllerID.clear();
                  _controllerAmount.clear();
                  _controllerPost.clear();
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


