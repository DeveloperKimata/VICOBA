import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Group_id',
  hintStyle: TextStyle(color:Colors.white),
  fillColor: Colors.black12,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 2)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white70, width: 2)),
);

class Constants{
  static String appId="";
  static String apiKey = "";
  static String messagingSenderId = "";
  static String projectId ="";
}

///go router for pages.
void nextScreen(context, page){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color,message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    context: Text(
      message,
      style: const TextStyle(fontSize: 15),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    action: SnackBarAction(label: "OK", onPressed: (){}, textColor: Colors.green,),
  ));
}