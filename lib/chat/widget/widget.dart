import 'package:flutter/material.dart';

const textInputDecolation = InputDecoration(
labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2),
  ),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.grey, width: 2),
),
errorBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.red, width: 2),
  )
);