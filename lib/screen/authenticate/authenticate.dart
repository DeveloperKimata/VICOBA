import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/splash_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(()=> showSignIn =!showSignIn);
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
