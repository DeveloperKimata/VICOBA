// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vicoba_app_final_year_project/screen/authenticate/sign_in.dart';
//
// class signUp extends StatefulWidget {
//   signUp(this.data,{Key? key}) : super(key: key){
//   _documentReference = FirebaseFirestore.instance.collection('GROUPS').doc(data['id']);
//
//   _referenceUsers = _documentReference?.collection('USERS');
//
// }
//
//   Map data;
//   DocumentReference? _documentReference;
//   CollectionReference? _referenceUsers;
//   @override
//   State<signUp> createState() => _signUpState();
// }
//
// class _signUpState extends State<signUp> {
//
// TextEditingController _controllerUserId=TextEditingController();
//   TextEditingController _controllerGroupName=TextEditingController();
//   TextEditingController _controllerUserType=TextEditingController();
//   TextEditingController _controllerUserName=TextEditingController();
//   TextEditingController _controllerPassword=TextEditingController();
//   TextEditingController _controllerPhoneNumber=TextEditingController();
//   TextEditingController _controllerEmail=TextEditingController();
//
//   String error = '';
//
// CollectionReference? _referenceUsers;
//
//   @override
//   Widget build(BuildContext context) {
//     //final _formKey = GlobalKey<FormState>();
//     final size = MediaQuery.of(context).size;
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white70,
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //section 1
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image(
//                       image: const AssetImage("images/group1.png"),
//                       height: size.height * 0.1,
//                     ),
//                     const Text(
//                       'VICOBA',
//                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Village Community Banking',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 //section 2
//                 SizedBox(height: 30),
//                           TextFormField(
//                             controller: _controllerUserId,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.perm_identity_rounded),
//                               labelText: 'userID',
//                               hintText: 'userID',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerGroupName,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.group),
//                               labelText: 'groupName',
//                               hintText: 'groupName',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerUserType,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.leaderboard_sharp),
//                               labelText: 'userType',
//                               hintText: 'userType',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerUserName,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.person),
//                               labelText: 'userName',
//                               hintText: 'userName',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerPassword,
//                             decoration: InputDecoration(
//                                 prefixIcon: const Icon(Icons.fingerprint_rounded),
//                                 labelText: 'password',
//                                 //hintText: 'password',
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                                 suffixIcon: IconButton(
//                                     onPressed: (){obscureText: true;},
//                                     icon: const Icon(Icons.remove_red_eye_sharp))),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerPhoneNumber,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.phone),
//                               labelText: 'phoneNumber',
//                               hintText: 'phoneNumber',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           TextFormField(
//                             controller: _controllerEmail,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.email_sharp),
//                               labelText: 'Email',
//                               hintText: 'Email',
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () async{
//                                 Map<String,String> usersToAdd={
//                                   'userID': _controllerUserId.text,
//                                   'groupName': _controllerGroupName.text,
//                                   'userType': _controllerUserType.text,
//                                   'userName': _controllerUserName.text,
//                                   'password': _controllerPassword.text,
//                                   'phoneNumber': _controllerPhoneNumber.text
//                                 };
//
//                                 //add post
//                                 _referenceUsers?.add(usersToAdd);
//
//                                 //dismiss the bottom sheet
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('SIGN_UP'.toUpperCase()),
//                               style: ElevatedButton.styleFrom(
//                                 shape: const StadiumBorder(),
//                                 foregroundColor: Colors.white,
//                                 side: const BorderSide(color: Colors.black),
//                                 backgroundColor: Colors.black,
//                                 padding: const EdgeInsets.symmetric(vertical: 20),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(error,
//                             style: const TextStyle(
//                                 color: Colors.red, fontSize: 15
//                             ),),
//                 const SizedBox(height: 1),
//                 Center(
//                     child: TextButton(onPressed: (){
//                       Get.to(()=>const SignIn());
//                     },
//                       child: const Text.rich(
//                           TextSpan(
//                               text: "Already have an Account?",
//                               style:TextStyle(color:Colors.black,
//                                   fontSize: 15),
//                               children: [
//                                 TextSpan(
//                                   text: ' LogIn',
//                                   style:TextStyle(color:Colors.blue,
//                                       fontSize: 15),
//                                 )
//                               ]
//                           )
//                       ),
//                     )
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
