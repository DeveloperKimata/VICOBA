import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/forgetPassword/opt_screen.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';

class phoneNumberVerification extends StatefulWidget {
  const phoneNumberVerification({Key? key}) : super(key: key);

  @override
  State<phoneNumberVerification> createState() => _phoneNumberVerificationState();
}

class _phoneNumberVerificationState extends State<phoneNumberVerification> {
  final _formKey = GlobalKey<FormState>();

  String phoneNumber = '';
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
                        'Reset your password via phoneNumber verification ',
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
                      validator: (val) => val!.length < 10 ? 'Enter 10+ chars long for phoneNumber' : null,
                      onChanged: (val){
                        setState(() => phoneNumber = val);
                      },
                      controller: controller.phoneNumber,
                      decoration: const InputDecoration(
                        label: Text("phoneNumber"),
                        hintText: 'phoneNumber',
                    border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            AuthRepository.instance.phoneAuthentication(phoneNumber);
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
