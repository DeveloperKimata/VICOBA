import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/forgetPassword/opt_screen.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';

class emailVerification extends StatefulWidget {
  const emailVerification({Key? key}) : super(key: key);

  @override
  State<emailVerification> createState() => _emailVerificationState();
}

class _emailVerificationState extends State<emailVerification> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final controller = Get.put(signUpController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children:[
                const SizedBox(height: 5*4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: const AssetImage("images/forget.png"),
                        height: size.height * 0.25,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Forget Password',
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                          'Reset your password via Email verification ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Form(child: Column(
                  children: [
                    TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  },
                      controller: controller.email,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                        label: Text("Email"),
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            AuthRepository.instance.phoneAuthentication(email);
                            Get.to(() => OTPScreen());
                          }
                        },
                        child: Text('NEXT'.toUpperCase()),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    )
                  ],
                ))

              ],
            ),
          ),
        ));
  }
}
