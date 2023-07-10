//
// import 'dart:io';
//
//
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class Info extends StatefulWidget {
//   const Info({Key? key}) : super(key: key);
//
//   @override
//   State<Info> createState() => _InfoState();
// }
//
// class _InfoState extends State<Info> {
//
//   PlatformFile? pickedFile;
//   Future chooseFile() async{
//     final result = await FilePicker.platform.pickFiles();
//     if(result == null) return;
//
//     setState(() {
//       pickedFile = result.files.first;
//     });
//   }
//   //PlatformFile? pickedFile;
//   UploadTask? uploadTask;
//   Future uploadFile() async{
//     final path = 'katiba/${pickedFile!.name}';
//     final file = File(pickedFile!.path!);
//
//     final ref = FirebaseStorage.instance.ref().child(path);
//     setState((){
//       uploadTask = ref.putFile(file);
//     });
//
//     final snapshot = await uploadTask!.whenComplete(() {});
//
//     final urlDownload = await snapshot.ref.getDownloadURL();
//     print('Download Link: $urlDownload');
//
//     setState(() {
//       uploadTask = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//         backgroundColor: Colors.orangeAccent[90],
//         body: SingleChildScrollView(
//         child: Container(
//         padding: EdgeInsets.only(top: 30, left: 30, right: 30),
//     child: Column(
//     children: [
//     Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Positioned(
//     top: 35,
//     right: 320,
//     child: ClipRRect(
//     borderRadius: BorderRadius.circular(7),
//     child: Container(
//     height: 80,
//     width: 80,
//     child: Image(image: AssetImage('images/group1.png'),),
//     ),
//     ),
//     ),
//     Center(child: const Text('Group Information',
//     style: TextStyle(
//     fontSize: 30,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,),),)
//     ],
//     ),
//       SizedBox(height: 50),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if(pickedFile != null)
//           Expanded(
//               child: Container(
//             child: Image.file(File(pickedFile!.path!),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//           )),
//         ],
//       )
//           ]
//         )
//         )
//         )
//     )
//     );
//   }
//   Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20),
//   child: Column(
//   children: [
//   if(pickedFile != null)
//   Container(
//   alignment: Alignment.bottomLeft,
//   decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(10),
//   border: Border.all(width: 2, color: Colors.orange)),
//   width: 300,
//   child: TextButton(
//   onPressed: chooseFile,
//   child: Text(
//   pickedFile!.name,
//   style: TextStyle(
//   fontSize: 15,
//   color: Colors.black,
//   ),
//   ),
//   ),
//   ),
//   ],
//   ),
//   )
// }


