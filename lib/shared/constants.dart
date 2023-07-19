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
  static String appId="1:684610668563:web:c1c2f6e1501db449d3d7e6";
  static String apiKey = "AIzaSyC9JV-Qx6MIBJ_1NFK46W5qohtyFk2rcqY";
  static String messagingSenderId = "684610668563";
  static String projectId ="vicoba-app-final-year-project";
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
    content: Text(
      message,
      style: const TextStyle(fontSize: 15),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    action: SnackBarAction(label: "OK", onPressed: (){}, textColor: Colors.green,),
  ));
}