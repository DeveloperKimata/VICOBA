import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/sign_in.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/auth_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // Validate phone number
  bool validatePhoneNumber(String phoneNumber) {
    final pattern = r'^\d{10}$'; // Assumes the phone number should have exactly 10 digits
    return RegExp(pattern).hasMatch(phoneNumber);
  }

// Validate username
  bool validateUsername(String userName) {
    final pattern = r'^[A-Za-z]+$'; // Allows only alphabetical characters
    return RegExp(pattern).hasMatch(userName);
  }

// Validate ID
  bool validateID(String memberID) {
    return int.tryParse(memberID) != null;
  }
   AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading =false;
  //text field state
  String email = '';
  String password = '';
  String memberID = '';
  String userName = '';
  String userType = '';
  String phoneNumber = '';

  String? selectedItem;
  List<String> validItems = ["chairperson", "member", "secretary", "treasurer"];
  String error = '';
  @override
  Widget build(BuildContext context) {

    // Validate input
    bool isValidPhone = validatePhoneNumber(phoneNumber);
    bool isValidUsername = validateUsername(userName);
    bool isValidID = validateID(memberID);

    final size = MediaQuery.of(context).size;

    final controller = Get.put(signUpController());

    return _isLoading ? CircularProgressIndicator(color: Colors.orangeAccent,) : SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
          body: _isLoading ? Center(child: CircularProgressIndicator(color: Colors.orangeAccent,),) : SingleChildScrollView(
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
                      //validator: (val) => val!.isEmpty ? 'Enter memberID' : null,
                      onChanged: (val){
                        setState(() => memberID = val);
                      },
                      //validator: (val) {
                      //   if (val!.isEmpty) {
                      //     return ' memberID';
                      //   } else if (!val.contains('@') || !val.contains('.')) {
                      //     return 'Enter a valid memberID';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.number,
                      controller: controller.memberID,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.perm_identity_rounded),
                          labelText: 'memberID',
                          hintText: 'memberID',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)
                      )

                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: validItems.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      decoration: textInputDecoration.copyWith(
                          hintText: 'userName',
                          labelText: 'Select userType',
                      ),
                    ),
                    // TextFormField(
                    //   validator: (val) => val!.isEmpty ? 'Enter userType' : null,
                    //   onChanged: (val){
                    //     setState(() => userType = val);
                    //   },
                    //   controller: controller.userType,
                    //   decoration: textInputDecoration.copyWith(
                    //       prefixIcon: const Icon(Icons.leaderboard_sharp),
                    //       labelText: 'userType',
                    //       hintText: 'userType',
                    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)
                    //   )
                    //       ),
                    // ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter userName' : null,
                      onChanged: (val){
                        setState(() => userName = val);
                      },
                      controller: controller.userName,
                      decoration: textInputDecoration.copyWith(prefixIcon: const Icon(Icons.person),
                          labelText: 'userName',
                          hintText: 'userName',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100))
                          ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val!.length < 6 ? 'Enter 6 chars long for password' : null,
                      onChanged: (val){
                        setState(() => password = val);
                      },
                      controller:controller.password,
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
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) => val!.length < 10 ? 'Enter 10+ chars long for phoneNumber' : null,
                      onChanged: (val){
                        setState(() => phoneNumber = val);
                      },
                      controller:controller.phoneNumber,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'phoneNumber',
                          hintText: 'phoneNumber',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)
                      )

                         ),
                    ),
                    const SizedBox(height: 10),
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
                      controller: controller.email,
                      decoration: textInputDecoration.copyWith(
                        prefixIcon: const Icon(Icons.email_sharp),
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      )
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          if(isValidPhone && isValidUsername && isValidID && _formKey.currentState!.validate()){
                            setState(() {
                              _isLoading = true;
                            });
                            await _auth.registerUserWithEmailandPassword(memberID,userType,userName,password,
                                phoneNumber,email).then((value) async{
                              if(value == true){
                                //saving the shared preference state
                                await helperFunctions.saveUserLoggedInStatus(true);
                                await helperFunctions.saveMemberIdSF(memberID);
                                await helperFunctions.saveUserTypeSF(userType);
                                await helperFunctions.saveUserNameSF(userName);
                                await helperFunctions.savePhoneNumberSF(phoneNumber);
                                await helperFunctions.saveUserEmailSF(email);

                                nextScreenReplace(context, Bottom());
                              }else{
                                Get.snackbar("Error", "Something went wrong, check your credential.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.transparent.withOpacity(0.1),
                                    colorText: Colors.red);
                                print(error.toString());
                              }
                            });
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
