// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vicoba_app_final_year_project/payyment/Screens/Info.dart';
//
// class notification extends StatelessWidget {
//   notification({Key? key}) : super(key: key){
//     _referenceReport=FirebaseFirestore.instance.collection('LOANS');
//     _future=_referenceReport.get();
//   }
//   late CollectionReference _referenceReport;
//   late Future<QuerySnapshot>_future;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 50, left: 15, right: 15),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(7),
//                     child: Container(
//                       height: 80,
//                       width: 80,
//                       child:IconButton(
//                         onPressed: (){
//                           Get.back();
//                         },
//                         icon: const Icon(Icons.arrow_back_ios),
//                       ),
//                     ),
//                   ),
//                   Center(child: const Text('Loan Request',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,),),)
//                 ],
//               ),
//               SizedBox(height: 50),
//               FutureBuilder<QuerySnapshot>(
//                 future: _future,
//                 builder: (context,snapshot){
//                   if(snapshot.hasError)
//                   {
//                     return Center(child: Text('Error:${snapshot.error}'));
//                   }
//
//                   if(snapshot.hasData)
//                   {
//                     QuerySnapshot data=snapshot.data!;
//                     List<QueryDocumentSnapshot> documents=data.docs;
//                     List<Map> items=documents.map((e) => {
//                       'id':e.id,
//                       'requestStatement':e['requestStatement']}).toList();
//
//                     return ListView.builder(
//                         itemCount: documents.length,
//                         itemBuilder: (context,index){
//                           Map thisItem=items[index] as Map;
//                           return Column(
//                             children: [
//                               ListTile(
//                                 onTap: (){
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info(thisItem)));
//                                 },
//                                 tileColor: Colors.orange.withOpacity(0.1),
//                                 title: Text(thisItem['requestStatement']),),
//                               SizedBox(height: 10),
//                             ],
//                           );
//                         });
//                   }
//
//                   return Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/loanModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/notification_controller.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

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
                    Container(
                      height: 80,
                      width: 80,
                      child:Image(image: AssetImage('images/group1.png'),),
                    ),
                    Center(child: const Text('Notification',
                      style: TextStyle(color: Colors.black,
                          fontSize: 20,fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 10),
                // FutureBuilder<List<loanModel>>(
                //   future: controller.getAllLoan(),
                //   builder: (context, snapshot){
                //     if(snapshot.connectionState == ConnectionState.done){
                //       if(snapshot.hasData){
                //         return ListView.builder(
                //           shrinkWrap: true,
                //           itemCount: snapshot.data!.length,
                //           itemBuilder: (c,index){
                //             return Column(
                //               children: [
                //                 ListTile(
                //                   onTap: (){
                //                     Get.to(() => Info());
                //                   },
                //                   iconColor: Colors.orange,
                //                   tileColor: Colors.orange.withOpacity(0.1),
                //                   leading: Icon(Icons.monetization_on_outlined),
                //                   title: Text('${snapshot.data![index].loanRequest}'),
                //                 ),
                //                 SizedBox(height: 10),
                //               ],
                //             );
                //           },
                //         );
                //       }
                //       else if(snapshot.hasError){
                //         return Center(child: Text(snapshot.error.toString()),);
                //       }else{
                //         return Center(child: Text('Something went wrong'),);
                //       }
                //     }else{
                //       return const Center(child: CircularProgressIndicator());
                //     }
                //   },
                // ),
                FutureBuilder<List<loanModel>>(
                  future: controller.getAllLoan(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData ){
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c,index){
                            return Column(
                              children: [
                                ListTile(
                                  onTap: (){
                                    //Get.to(() => Info());
                                  },
                                  iconColor: Colors.orange,
                                  tileColor: Colors.orange.withOpacity(0.1),
                                  leading: Icon(Icons.monetization_on_outlined),
                                  title: Text('${snapshot.data![index].controllerStatement}'),
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        );
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()),);
                      }else{
                        return Center(child: Text('Something went wrong'),);
                      }
                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
