// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:vicoba_app_final_year_project/payyment/data/model/storage.dart';
//
// class Info extends StatelessWidget {
//   Info(this.data, {Key? key}) : super(key: key) {
//     _documentReference =
//         FirebaseFirestore.instance.collection('LOANS').doc(data['userID']);
//
//     _referenceReport = _documentReference?.collection('TRANSACTIONS');
//
//     _streamReport = _referenceReport?.orderBy('posted_on',descending: true).snapshots();
//   }
//
//   Map data;
//   DocumentReference? _documentReference;
//   CollectionReference? _referenceReport;
//   Stream<QuerySnapshot>? _streamReport;
//
//   String imageName = '';
//
//   @override
//   Widget build(BuildContext context) {
//     final Storage storage = Storage();
//     TextEditingController controller = TextEditingController();
//     return Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(top: 70, left: 30, right: 30),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(7),
//                       child: Container(
//                         height: 80,
//                         width: 80,
//                         child: Image(image: AssetImage('images/group1.png'),),
//                       ),
//                     ),
//                     Center(child: const Text('Details',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,),),)
//                   ],
//                 ),
//                 SizedBox(height: 50),
//                 // Column(
//                 //   children: [
//                 //     Center(
//                 //       child: ElevatedButton(
//                 //           onPressed: () async{
//                 //             final result = await FilePicker.platform.pickFiles(
//                 //               allowMultiple: false,
//                 //               type: FileType.custom,
//                 //               allowedExtensions: ['png','jpg','jpeg'],
//                 //             );
//                 //
//                 //             if(result == null){
//                 //               ScaffoldMessenger.of(context).showSnackBar(
//                 //                 const SnackBar(content: Text('No file selected.')),
//                 //               );
//                 //               return null;
//                 //             }
//                 //             final path = result.files.single.path!;
//                 //             final fileName = result.files.single.name;
//                 //
//                 //             storage.uploadFile(path, fileName).then((value) => print('Done'));
//                 //           },
//                 //           child: Text('Upload File')),
//                 //     ),
//                 //     FutureBuilder(
//                 //       future: storage.downloadURL(imageName),
//                 //         builder: (BuildContext context,
//                 //         AsyncSnapshot<String> snapshot){
//                 //           if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
//                 //             return Container(
//                 //               width: 450,
//                 //               height: 450,
//                 //               child: Image.network(
//                 //                 snapshot.data!,
//                 //                   fit: BoxFit.cover,
//                 //               ),
//                 //             );
//                 //         }
//                 //           if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
//                 //             return CircularProgressIndicator();
//                 //         }
//                 //           return Container();
//                 //         })
//                 //   ],
//                 // )
//                   Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                   Container(
//                   color: Colors.black12,
//                   padding: EdgeInsets.all(18),
//                   child
//                 :Column(
//                     children: [
//                       Text(data['userID']),
//                       Text(data['Amount']),
//                       Text(data['Statement']),
//                     ],
//                   ),
//                     ),
//                     buildCommentListView(),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(onPressed:(){
//       showModalBottomSheet(
//           context: context,
//           builder:(BuildContext context) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: controller,
//                   ),
//                   ElevatedButton(onPressed: () {
//                     //get the data
//                     Map<String, dynamic> reportToAdd = {
//                       'report_text': controller.text,
//                       'posted_on':FieldValue.serverTimestamp()
//                     };
//                     //add post
//                     _referenceReport?.add(reportToAdd);
//
//                     //dismiss the bottom sheet
//                     Navigator.of(context).pop();
//                     //Get.to(() => Home());
//                   }, child: Text('submit')),
//                 ],
//               ),
//             );
//           }
//       );
//     },
//     child: Icon(Icons.send),
//           backgroundColor: Colors.orange,
//     )
//     );
//   }
//
//   Widget buildCommentListView() {
//     ///display confirm text
//     return StreamBuilder<QuerySnapshot>(
//       stream: _streamReport,
//         builder: (BuildContext context, AsyncSnapshot snapshot){
//         if(snapshot.hasError){
//           return Center(child: Text('Some error occured ${snapshot.error}'));
//         }else if(snapshot.hasData){
//           QuerySnapshot data = snapshot.data;
//           List<QueryDocumentSnapshot> documents = data.docs;
//           List<Map> items = documents.map((e) => {
//             'userID': e.id,
//             'report_text':e['report_text']
//           }).toList();
//           return ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index){
//                 Map thisItem = items[index];
//                 return ListTile(
//                   title: Text(thisItem['report_text'].toString()),
//                 );
//               });
//         }else{
//           return Center(child: CircularProgressIndicator());
//         }
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/models/transModel.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/notification_controller.dart';
import 'package:vicoba_app_final_year_project/screen/controller/trans_controller.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(notificationController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Center(child: const Text('Transactions',
                      style: TextStyle(color: Colors.black,
                          fontSize: 20,fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 10),
                /// future Builder to load cloud data
                FutureBuilder(
                    future: controller.getLoanData(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        loanModel loan = snapshot.data as loanModel;
                        userModel user = snapshot.data as userModel;
                        if(snapshot.hasData && user.userID == loan.id){

                            //controller
                            TextEditingController _loanRequest = TextEditingController(
                                text: 'Loan Request');
                            TextEditingController _controllerID = TextEditingController();
                            FocusNode id = FocusNode();
                            TextEditingController _controllerAmount = TextEditingController();
                            FocusNode Amount = FocusNode();
                            TextEditingController _controllerAccNo = TextEditingController();
                            FocusNode AccNo = FocusNode();
                            TextEditingController _controllerName = TextEditingController();
                            TextEditingController _controllerPost = TextEditingController();
                            TextEditingController _controllerStatus = TextEditingController();
                            return Column(

                              /// step 4 - wrap this widget with futureBuilder
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(

                                      width: 120,
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            100),
                                        child: Image(
                                          image: AssetImage("images/2.jpg"),),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              100),
                                          color: Colors.yellowAccent,
                                        ),
                                        child: Icon(Icons.camera_alt_outlined,
                                          color: Colors.black, size: 20,),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                TextFormField(
                                  controller: _loanRequest,
                                  decoration: InputDecoration(
                                    labelText: 'requestStatement',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'requestStatement',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'id',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'Amount',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                  keyboardType: TextInputType.number,
                                  controller: _controllerAccNo,
                                  decoration: InputDecoration(
                                    labelText: 'AccNo',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'AccNo',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                  controller: _controllerName,
                                  decoration: InputDecoration(
                                    labelText: 'groupName',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'groupName',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'Statement',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                  controller: _controllerStatus,
                                  decoration: InputDecoration(
                                    labelText: 'Status',
                                    labelStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                    hintText: 'Status',
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
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
                                ElevatedButton(onPressed: () {
                                  final trans = transModel(
                                    id: _controllerID.text.trim(),
                                    Amount: _controllerAmount.text.trim(),
                                    AccNo: _controllerAccNo.text.trim(),
                                    Name: _controllerName.text.trim(),
                                    statement: _controllerPost.text.trim(),
                                  );
                                  transController.instance.createTransaction(
                                      trans);
                                  _controllerID.clear();
                                  _controllerAmount.clear();
                                  _controllerAccNo.clear();
                                  _controllerName.clear();
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
                            );
                        }else if(snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()));
                        }else{
                          return Center(child: Text('Something went wrong'));
                        }
                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    })

              ],
            ),
          ),
        )
    );
  }
}
