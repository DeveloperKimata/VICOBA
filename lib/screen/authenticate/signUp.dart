import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/forgetPassword/opt_screen.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/loginPage.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/sign_in.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

//  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String groupID = '';
  String email = '';
  String password = '';
  String userID = '';
  String userName = '';
  String userType = '';
  String phoneNumber ='';

  String error = '';
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final controller = Get.put(signUpController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //section 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("images/group1.png"),
                    height: size.height * 0.1,
                  ),
                  const Text(
                    'VICOBA',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Village Community Banking',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              //section 2
              Form(
                 key: _formKey,
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter userID' : null,
                      onChanged: (val){
                        setState(() => userID = val);
                      },
                      controller: controller.userID,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.perm_identity_rounded),
                        labelText: 'userID',
                        hintText: 'userID',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter groupID' : null,
                      onChanged: (val){
                        setState(() => groupID = val);
                      },
                      controller: controller.groupID,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.group),
                        labelText: 'groupID',
                        hintText: 'groupID',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter userType' : null,
                      onChanged: (val){
                        setState(() => userType = val);
                      },
                      controller: controller.userType,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.leaderboard_sharp),
                          labelText: 'userType',
                          hintText: 'userType',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter userName' : null,
                      onChanged: (val){
                        setState(() => userName = val);
                      },
                      controller: controller.userName,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'userName',
                          hintText: 'userName',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val!.length < 8 ? 'Enter 8+ chars long for password' : null,
                      onChanged: (val){
                        setState(() => password = val);
                      },
                      controller:controller.password,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fingerprint_rounded),
                          labelText: 'password',
                          //hintText: 'password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          suffixIcon: IconButton(
                              onPressed: (){obscureText: true;},
                              icon: const Icon(Icons.remove_red_eye_sharp))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.length < 10 ? 'Enter 10+ chars long for phoneNumber' : null,
                      onChanged: (val){
                        setState(() => phoneNumber = val);
                      },
                      controller:controller.phoneNumber,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'phoneNumber',
                          hintText: 'phoneNumber',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                         ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter email' : null,
                      onChanged: (val){
                        setState(() => email = val);
                      },
                      controller: controller.email,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_sharp),
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            // dynamic result = await _auth.registerWithEmailAndPassword(email.text, password.text);
                            // if(result == error){
                            //   setState(() => error = 'please supply a valid email');
                            // }else{
                            //   print(result.toString());
                            // email.clear();
                            // password.clear();
                            // userName.clear();
                            // userType.clear();
                            // userID.clear();
                            // phoneNumber.clear();
                            // groupID.clear();
                            // //Navigator.pop(context);
                            // }
                            final user = userModel(
                              userID: controller.userID.text.trim(),
                              groupID: controller.groupID.text.trim(),
                              userType: controller.userType.text.trim(),
                              userName: controller.userName.text.trim(),
                              password: controller.password.text.trim(),
                              phoneNumber: controller.phoneNumber.text.trim(),
                              email: controller.email.text.trim(),
                            );
                            signUpController.instance.createUser(user);
                            controller.email.clear();
                            controller.password.clear();
                            controller.userName.clear();
                            controller.userType.clear();
                            controller.userID.clear();
                            controller.phoneNumber.clear();
                            controller.groupID.clear();
                            // Get.to(() => OTPScreen());
                         }
                        },
                        child: Text('SIGN_UP'.toUpperCase()),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(error,
                      style: const TextStyle(
                          color: Colors.red, fontSize: 15
                      ),),
                  ],
                ),
              )),
              const SizedBox(height: 1),
               Center(
                child: TextButton(onPressed: (){
                  Get.to(()=>const SignIn());
                },
                child: const Text.rich(
                    TextSpan(
                        text: "Already have an Account?",
                        style:TextStyle(color:Colors.black,
                            fontSize: 15),
                        children: [
                          TextSpan(
                            text: ' LogIn',
                            style:TextStyle(color:Colors.blue,
                                fontSize: 15),
                          )
                        ]
                    )
                ),
              )
              )
            ],
          ),
        ),
      ),
          ),
    );
  }
}
