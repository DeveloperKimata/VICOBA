
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/forgetPassword/emailVerification.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/forgetPassword/phoneNumber_verification.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/signUp.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/auth_services.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';
import 'package:vicoba_app_final_year_project/shared/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool load = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return load
        ? const loading()
        : SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white70,
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //section 1
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: const AssetImage("images/group1.png"),
                              height: size.height * 0.15,
                            ),
                            const Text(
                              'VICOBA',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
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
                        signIn(
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Get.to(() => const SignUp());
                              },
                              child: const Text.rich(TextSpan(
                                  text: "Don't have an Account?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: ' Sign_Up',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    )
                                  ]))),
                        )
                      ],
                    ),
                  ),
                )),
          );
  }
}

class signIn extends StatefulWidget {
  const signIn({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  //variables
  String email = '';
  String password = '';

  AuthService _auth = AuthService();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),
          )
        : Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter email';
                        } else if (!val.contains('@') || !val.contains('.')) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() => email = val);
                      },
                      //controller: controller.email,
                      decoration: textInputDecoration.copyWith(
                        prefixIcon: const Icon(Icons.email_sharp),
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      )
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                      obscureText: true,
                      validator: (val) => val!.length < 6 ? 'Enter 6 chars long for password' : null,
                      onChanged: (val){
                        setState(() => password = val);
                      },
                      //controller:controller.password,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.fingerprint_rounded),
                          labelText: 'password',
                          hintText: 'password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          suffixIcon: IconButton(
                              onPressed: (){obscureText: true;},
                              icon: const Icon(Icons.remove_red_eye_sharp))
                      )
                  ),
                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                )),
                                builder: (context) => Container(
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Reset your password!",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            "Choose one of below to reset your password",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Get.to(() => emailVerification());
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 40,
                                                  bottom: 40,
                                                  right: 20,
                                                  left: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey.shade200),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.mail_outline_rounded,
                                                    size: 40,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        "Email",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "Reset via Email verification",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Get.to(() =>
                                                  phoneNumberVerification());
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 40,
                                                  bottom: 40,
                                                  right: 20,
                                                  left: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey.shade200),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .mobile_friendly_rounded,
                                                    size: 40,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        "PhoneNumber",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "Reset via Phone verification",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: const Text('Forget Password?'))),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          await _auth.loginInWithUserNameandPassword(
                                  password as String,
                                  email as String)
                              .then((value) async {
                            if (value == true) {
                              QuerySnapshot snapshot =
                              await DatabaseService(uid:  FirebaseAuth.instance.currentUser!.uid).getUserData(email as String);

                              //saving the value to our shared preferences
                              await helperFunctions.saveUserLoggedInStatus(true);
                              await helperFunctions.saveUserEmailSF(email);
                              await helperFunctions.saveUserNameSF(snapshot.docs[0]['userName']);

                              nextScreenReplace(context, Bottom());
                            } else {
                              showSnackbar(context, Colors.white60, value);
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          });

                        }
                      },
                      child: Text('Login'.toUpperCase()),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black),
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ],
              ),
            ));
  }
}
