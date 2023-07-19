import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/models/transModel.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/sign_in.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/screen/controller/trans_controller.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/auth_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class loanRequest extends StatefulWidget {
  const loanRequest({Key? key}) : super(key: key);

  @override
  State<loanRequest> createState() => _loanRequestState();
}

class _loanRequestState extends State<loanRequest> {

  // Validate phone number
  bool validateAccNo(String AccNo) {
    final pattern = r'^\d{11}$'; // Assumes the phone number should have exactly 10 digits
    return RegExp(pattern).hasMatch(AccNo);
  }

// Validate username
  bool validateGroupName(String groupName) {
    final pattern = r'^[A-Za-z]+$'; // Allows only alphabetical characters
    return RegExp(pattern).hasMatch(groupName);
  }

// Validate ID
  bool validateAmount(String Amount) {
    return int.tryParse(Amount) != null;
  }
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading =false;
  //text field state
  String groupName = '';
  String AccNo = '';
  String Amount = '';
  String loanStatus = '';

  String? selectedItem;
  List<String> validItems = ["confirmed", "rejected"];
  String error = '';
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // Validate input
    bool isValidAmount = validateAmount(Amount);
    bool isValidGroupName = validateGroupName(groupName);
    bool isValidAccNo = validateAccNo(AccNo);
    final controller = Get.put(transController());

    return _isLoading ? CircularProgressIndicator(color: Colors.orangeAccent,) : SafeArea(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Center(child: const Text('loan Request',
                          style: TextStyle(color: Colors.black,
                              fontSize: 20,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                //section 2
                Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            validator: (val) => val!.isEmpty ? 'Enter accountName of your group' : null,
                            onChanged: (val){
                              setState(() => groupName = val);
                            },
                            controller: controller.groupName,
                            decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.group),
                              labelText: 'accName',
                              hintText: 'accName',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            validator: (val) => val!.isEmpty ? 'Enter bankAccount number of your group' : null,
                            onChanged: (val){
                              setState(() => AccNo = val);
                            },
                            keyboardType: TextInputType.number,
                            controller: controller.AccNo,
                            decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.numbers),
                              labelText: 'bankAccNo',
                              hintText: 'bankAccNo',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            validator: (val) => val!.isEmpty ? 'Enter amount you want to withdraw' : null,
                            onChanged: (val){
                              setState(() => Amount = val);
                            },
                            keyboardType: TextInputType.number,
                            controller: controller.Amount,
                            decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.person),
                              labelText: 'Amount',
                              hintText: 'Amount',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
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
                              hintText: 'loanStatus',
                              labelText: 'Select loanStatus',
                            ),
                          ),
                          // TextFormField(
                          //   validator: (val) => val!.isEmpty? 'Enter loanStatus as given' : null,
                          //   onChanged: (val){
                          //     setState(() => loanStatus = val);
                          //   },
                          //   controller:controller.loanStatus,
                          //   decoration: InputDecoration(
                          //     //prefixIcon: const Icon(Icons.phone),
                          //     labelText: 'loanStatus',
                          //     hintText: 'loanStatus',
                          //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          //   ),
                          // ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async{
                                if(_formKey.currentState!.validate() && isValidAccNo && isValidGroupName && isValidAmount){
                                  final trans = transModel(
                                    groupName: controller.groupName.text.trim(),
                                    AccNo: controller.AccNo.text.trim(),
                                    Amount: controller.Amount.text.trim(),
                                    selectedItem: controller.selectedItem.text.trim(),
                                  );
                                  transController.instance.createTransaction(trans);
                                  controller.Amount.clear();
                                  controller.AccNo.clear();
                                  controller.selectedItem.clear();
                                  controller.groupName.clear();
                                  // Get.to(() => OTPScreen());
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Submit'.toUpperCase()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
