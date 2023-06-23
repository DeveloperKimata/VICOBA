import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/loginPage.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/fadeInAnimation/animationDesign.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/fadeInAnimation/fia_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState(){
    startSplashAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
             SfadeInAnimation(
               durationInMs: 1600,
               animate: true,
               animatePosition: sAnimatePosition(
                    topBefore:-80, leftBefore:-80, topAfter:0, leftAfter:0,),
               child: const Image(
                 width: 300,
                 height: 300,
                 image: AssetImage('images/spl.png'),
               ),
             ),
            SfadeInAnimation(
              durationInMs: 1600,
              animate: true,
              animatePosition: sAnimatePosition(
                topBefore:200, leftBefore:-10, topAfter:200, leftAfter:30,),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('VICOBA',
                     style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Village Community Banking',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
            ),
            SfadeInAnimation(
              durationInMs: 2400,
              animate: true,
              animatePosition: sAnimatePosition(
                bottomBefore:80, bottomAfter:250,rightAfter: 40, rightBefore: 40),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: const Image(
                  image: AssetImage('images/group5.png'),
                ),
              ),
            ),
            SfadeInAnimation(
                 durationInMs: 2400,
                 animate: true,
                 animatePosition: sAnimatePosition(
                     bottomBefore:40, bottomAfter:60,rightAfter: 20, rightBefore: 20),
              child: AnimatedOpacity(
                duration:  const Duration(milliseconds: 2000),
                opacity: animate ? 1:0,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.lightBlue[200],
                  ),

                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Future startSplashAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
      await Future.delayed(const Duration(milliseconds: 3000));
    setState(() => animate = false);
    await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
  }
}


