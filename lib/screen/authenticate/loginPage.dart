import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/register.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/signUp.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/sign_in.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/fadeInAnimation/animationDesign.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/fadeInAnimation/fia_model.dart';
import 'package:vicoba_app_final_year_project/screen/userAcc.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const account();
  }
}

class account extends StatefulWidget {
  const account({
    Key? key,
  }) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {

  bool animate = false;

  @override
  void initState(){
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:[
            SfadeInAnimation(
            durationInMs: 1200,
            animate: true,
            animatePosition: sAnimatePosition(
                bottomBefore:-100, bottomAfter:0,rightAfter: 0, rightBefore: 0,leftAfter: 0, leftBefore: 0, topAfter: 0, topBefore: 0,),
              child: Container(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        image: const AssetImage('images/group1.png'),
                        height: MediaQuery.of(context).size.height * 0.3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'VICOBA',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: TextButton(onPressed: (){
                            Get.to(() => Register());
                          },
                              child: const Text.rich(
                                  TextSpan(
                                      text: "Don't have a group?",
                                      style:TextStyle(color:Colors.black,
                                          fontSize: 15),
                                      children: [
                                        TextSpan(
                                          text: ' Register Here',
                                          style:TextStyle(color:Colors.blue,
                                              fontSize: 15),
                                        )
                                      ]
                                  )
                              )
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  Get.to(()=>const SignIn());
                                },
                                style: OutlinedButton.styleFrom(
                                 // shape: side: BorderSide.none,
                                    shape: StadiumBorder(),
                                  foregroundColor: Colors.black,
                                  side: const BorderSide(color: Colors.blueGrey),
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                ),
                                child: Text("LogIn".toUpperCase()))),
                        const SizedBox(width: 10),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(()=>const SignUp());
                                },
                                style: ElevatedButton.styleFrom(
                                  //shape: side: BorderSide.none,
                                  shape: StadiumBorder(),
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.black),
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                ),
                                child: Text("SignUp".toUpperCase()))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
  }
}
