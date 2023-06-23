// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class loanPage extends StatefulWidget {
//   const loanPage({Key? key}) : super(key: key);
//
//   @override
//   State<loanPage> createState() => _loanPageState();
// }
//
// class _loanPageState extends State<loanPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.brown,
//               Colors.white70,
//             ],
//             begin: const FractionalOffset(0.0, 0.4),
//             end: Alignment.topLeft,
//           ),
//         ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Container(
//                 //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//                 //   child: Row(
//                 //     children: [
//                 //       InkWell(
//                 //         onTap: (){
//                 //           Get.back();
//                 //         },
//                 //         child: const Icon(Icons.arrow_back_ios,
//                 //           size: 20,
//                 //         ),
//                 //       ),
//                 //       Expanded(child: Container()),
//                 //       // const CircleAvatar(
//                 //       //   radius: 50.0,
//                 //       //   backgroundImage: AssetImage('images/vicoba.jfif'),
//                 //       // ),
//                 //     ],
//                 //   ),
//                 // ),
//                 const Text(
//                   "loanForm",
//                   style: TextStyle(fontSize: 25, color: Colors.black),
//                 ),
//                 SizedBox(height: 30),
//                 const Card(
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0 ),
//                   child:ListTile(
//                     title: Text('loanID',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       ),),
//                   ),
//                 ),
//                 const Card(
//                     color: Colors.white70,
//                     margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0 ),
//                     child: ListTile(
//
//                       title: Text('memberID',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                         ),),
//                     )
//                 ),
//                 const Card(
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0 ),
//                   child:ListTile(
//                     title: Text('Amount',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       ),),
//                   ),
//                 ),
//                 const Card(
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0 ),
//                   child:ListTile(
//                     title: Text('loanStatus',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       ),),
//                   ),
//                 ),
//                 const Card(
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 25.0 ),
//                   child:ListTile(
//                     title: Text('schedule',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       ),),
//                   ),
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           return Colors.lightGreen; // Color when the button is pressed
//                         } else if (states.contains(MaterialState.disabled)) {
//                           return Colors.redAccent; // Color when the button is disabled
//                         }
//                         return Colors.black54; // Default color
//                       }),
//                     ),
//                     onPressed: () async {
//                     },
//                     child: const Text('Submit',
//                       style: TextStyle(color:Colors.white),)
//                 ),
//               ],
//             )),
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _memberIdController = TextEditingController();
  TextEditingController _loanAmountController = TextEditingController();
  String _loanStatus = 'Pending';
  TextEditingController _repaymentScheduleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Record Loan'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: const AssetImage("images/group1.png"),
                        height: size.height * 0.1,
                      ),
                      const Text(
                        'VICOBA',
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Village Community Banking',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Loan Form',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _memberIdController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter member ID';
                        }
                        return null;
                      },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint_rounded),
                      labelText: 'UserID',
                      hintText: 'userID',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      ),),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _loanAmountController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter loan amount';
                        }
                        // You can add additional validation logic for loan amount here
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint_rounded),
                          labelText: 'LoanAmount',
                          hintText: 'LoanAmount',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _loanStatus,
                      onChanged: (newValue) {
                        setState(() {
                          _loanStatus = newValue!;
                        });
                      },
                      items: <String>['Pending', 'Approved', 'Rejected']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint_rounded),
                            labelText: 'LoanStatus',
                            hintText: 'LoanStatus',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _repaymentScheduleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter repayment schedule';
                        }
                        // You can add additional validation logic for repayment schedule here
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint_rounded),
                          labelText: 'Repayment Schedule',
                          hintText: 'Repayment Schedule',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Loan recording logic goes here
                            String memberId = _memberIdController.text;
                            double loanAmount = double.parse(_loanAmountController.text);
                            String repaymentSchedule =
                                _repaymentScheduleController.text;

                            // TODO: Perform loan recording API call or database insertion

                            // Show success message or navigate to the next screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Loan recorded successfully!')),
                            );
                          }
                        },
                        child: Text('Record Loan'.toUpperCase()),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

