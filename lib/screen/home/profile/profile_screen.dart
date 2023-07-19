import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/pages/chatPage.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/loginPage.dart';
import 'package:vicoba_app_final_year_project/screen/controller/profileController.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/updateProfile.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/usersDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';

import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/auth_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class profileScreen extends StatefulWidget {
  String userName;
  String email;
  String memberID;
  String userType;
  String phoneNumber;
  profileScreen({Key? key, required this.userName, required this.email,required this.memberID, required this.userType,required this.phoneNumber}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        centerTitle: true,
        title: Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
      ),
      drawer: Drawer(
        child: ListView(
          padding:  EdgeInsets.symmetric(vertical: 50,),
          children: <Widget>[
            Icon(Icons.account_circle,
              size: 150,
              color: Colors.grey[700],),
            const SizedBox(height: 15,),
            Text(widget.userName, textAlign: TextAlign.center,style: const TextStyle(
                fontWeight: FontWeight.bold
            ),),
            Text(widget.email, textAlign: TextAlign.center,style: const TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            Divider(height: 2,),
            ListTile(
              onTap: (){
                nextScreenReplace(context, const chatPage());
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: Icon(Icons.groups),
              title: Text('Groups', style: TextStyle(
                  color: Colors.black
              ),),
            ),
            ListTile(
              onTap: (){},
              selectedColor: Colors.orangeAccent,
              selected: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(
                  color: Colors.black
              ),),
            ),
            // ListTile(
            //   onTap: (){},
            //   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //   leading: Icon(Icons.account_balance_wallet_outlined),
            //   title: Text('myWallet', style: TextStyle(
            //       color: Colors.black
            //   ),),
            // ),
            ListTile(
              onTap: (){
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('are you sure you want to logout?'),
                        actions: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          },
                              icon:Icon(Icons.cancel, color: Colors.red,) ),
                          IconButton(onPressed: () async{
                            await _auth.signOut();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                builder: (context) => loginPage()),
                                    (route) => false);
                          },
                              icon:Icon(Icons.done, color: Colors.green,) ),
                        ],
                      );
                    });
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: Icon(Icons.exit_to_app),
              title: Text('logOut', style: TextStyle(
                  color: Colors.black
              ),),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.account_circle, size: 200, color: Colors.grey[700],),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Full Name:', style: TextStyle(fontSize: 18),),
                Text(widget.userName, style: TextStyle(fontSize: 18),),
              ],
            ),
            Divider(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email:', style: TextStyle(fontSize: 18),),
                Text(widget.email, style: TextStyle(fontSize: 18),),
              ],
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{
                   Get.to(()=>updateProfile());
                },
                child: Text('View  full Profile'.toUpperCase()),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: Colors.orange[400],
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            // Divider(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('memberID:', style: TextStyle(fontSize: 18),),
            //     Text(widget.memberID, style: TextStyle(fontSize: 18),),
            //   ],
            // ),
            // Divider(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('userType:', style: TextStyle(fontSize: 18),),
            //     Text(widget.userType, style: TextStyle(fontSize: 18),),
            //   ],
            // ),
            // Divider(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('phoneNumber:', style: TextStyle(fontSize: 18),),
            //     Text(widget.phoneNumber, style: TextStyle(fontSize: 18),),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

