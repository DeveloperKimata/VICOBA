import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vicoba_app_final_year_project/screen/controller/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('CO\nDE',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold
            ),),
            Text('verification'.toUpperCase(),),
              const SizedBox(height: 40),
            const Text(
              'Enter a verification code sent at'+'\n member@email.com',
              textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 40,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 5,
              style: const TextStyle(fontSize: 17,
                  color: Colors.black),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              textFieldAlignment: MainAxisAlignment.spaceAround,
             // fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                otp = pin;
                OTPController.instance.verifyOTP(otp);
                //print("Completed: " + pin);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
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
        ),
      ),
    );
  }
}
