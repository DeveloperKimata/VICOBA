import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/profileController.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/updateProfile.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/usersDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';

import 'package:vicoba_app_final_year_project/services/auth_repository.dart';


class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  CollectionReference _referencePhotos = FirebaseFirestore.instance.collection('Photos');
  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profileController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent[90],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      top: 35,
                      right: 320,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          height: 80,
                          width: 80,
                          child: Image(image: AssetImage('images/group1.png'),),
                        ),
                      ),
                    ),
                    Center(child: const Text('Profile',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,),),)
                  ],

                ),
                SizedBox(height: 50),
                FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                        userModel user = snapshot.data as userModel;


                        // controller
                        final userName =  TextEditingController(text: user.userName);
                        final email =  TextEditingController(text: user.email);


                        return Column(
                          /// step 4 - wrap this widget with futureBuilder
                          children: [
                            Stack(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(image: AssetImage('images/1.jpg'),),
                                    ),
                                  ),
                                  // FutureBuilder(
                                  //     future: _referencePhotos.doc(imageURL).getDownloadURL(),
                                  //     builder: (BuildContext context,
                                  //         AsyncSnapshot<String> snapshot){
                                  //       if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                                  //         return Container(
                                  //           width: 120,
                                  //           height: 120,
                                  //           child: Image.network(
                                  //             snapshot.data!,
                                  //             fit: BoxFit.cover,
                                  //           ),
                                  //         );
                                  //       }
                                  //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                                  //         return CircularProgressIndicator();
                                  //       }
                                  //       return Container();
                                  //     }),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.yellow[700],
                                      ),
                                      child: IconButton(
                                          onPressed: () async{
                                            ImagePicker imagePicker = ImagePicker();
                                            XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                            print('${file?.path}');

                                            if(file == null) return;
                                            String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();

                                            //Get a reference for the image to be stored
                                            Reference referenceRoot = FirebaseStorage.instance.ref();
                                            Reference referenceDirImages = referenceRoot.child('photos');

                                            //Create a reference for the image to be stored
                                            Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                                            //Handle errors/success
                                            try{
                                              //store the file
                                              await referenceImageToUpload.putFile(File(file!.path));
                                              //Success: get the download URL
                                              imageURL = await referenceImageToUpload.getDownloadURL();
                                            }catch(e){

                                            }
                                            //Store the file
                                            referenceImageToUpload.putFile(File(file!.path));
                                          },
                                          icon: Icon(Icons.camera_alt_outlined, color: Colors.black,size: 20,)),
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(height: 10),
                    Text(user.userName!,style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,color: Colors.black),),
                    Text(user.email!,style: TextStyle(fontSize: 15,color: Colors.black),),
                          ],
                        );
                      }else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()),);
                      }else{
                        return Center(child: Text('Something went wrong'),);
                      }
                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                SizedBox(height:20),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => updateProfile());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text('Edit Profile',style: TextStyle(fontSize: 15,color: Colors.yellow[700]),),
                  ),
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 30),
                //menu
                ProfileMenuWidget(title: "Settings", icon: Icons.settings_sharp,onPress: (){},),
                ProfileMenuWidget(title: "Group Members", icon: Icons.group,onPress: (){ Get.to(() => usersDetails());},),
                Divider(),
                SizedBox(height: 10),
                ProfileMenuWidget(title: "Logout", icon: Icons.logout,
                  textColor: Colors.red, endIcon: false,
                  onPress: (){ AuthRepository.instance.logout();},),
            ]
          )
          ),
        )
      ),
    );
  }
}

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.endIcon = true,
    required this.onPress,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  State<ProfileMenuWidget> createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends State<ProfileMenuWidget> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPress,
      leading: Container(
        width: 40,
          height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          //color: Colors.transparent.withOpacity(0.1),
        ),
        child: Icon(widget.icon, color: Colors.blue[700],),
      ),
      title: Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.black87).apply(color: widget.textColor)),
      trailing:widget.endIcon ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey,),
      ):null,
    );
  }
}
