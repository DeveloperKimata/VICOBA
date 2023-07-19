import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';

class Report extends StatefulWidget {
  Report(this.data,{Key? key, required}) : super(key: key){
   // _documentReference =
        FirebaseFirestore.instance.collection('reports');

    //_referenceReport = _documentReference?.collection('reports');

  }

  Map data;
  DocumentReference? _documentReference;
  CollectionReference? _referenceReport;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController _loanRequest=TextEditingController(text: 'Report');

  TextEditingController _controllerType=TextEditingController();

  TextEditingController _controllerText=TextEditingController();

  DateTime date = new DateTime.now();

  // Validate username
  bool validateReport(String userName) {
    final pattern = r'^[A-Za-z]+$'; // Allows only alphabetical characters
    return RegExp(pattern).hasMatch(userName);
  }
  @override
  Widget build(BuildContext context) {
    // Validate input
    // bool isValidPhone = validateReportType(_controllerType.text);
    // bool isValidUsername = validateReportText(_controllerText.text);

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
                    Center(child: const Text('Report',
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
                    labelText: 'report',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'report',
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
                  controller: _controllerType,
                  decoration: InputDecoration(
                    labelText: 'reportType',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'reportType',
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
                  controller: _controllerText,
                  decoration: InputDecoration(
                    labelText: 'reportText',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    hintText: 'reportText',
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
                Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.orange)),
                  width: 300,
                  child: TextButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100));
                      if (newDate == Null) return;
                      setState(() {
                        date = newDate!;
                      });
                    },
                    child: Text(
                      'Date : ${date.year} / ${date.day} / ${date.month}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // showLoader?CircularProgressIndicator():
                ElevatedButton(onPressed: (){

                  Map<String,String> reportToAdd={
                    'requestStatement': 'Report',
                    'reportType': _controllerType.text,
                    'reportText': _controllerText.text,

                  };

                  //add post
                  widget._referenceReport?.add(reportToAdd);

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
