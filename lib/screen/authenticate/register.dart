import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/groupModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/register_controller.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(registerController());

  String name = '';
  String created_by = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
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
                ],
              ),
              //section 2
            Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter groupName' : null,
                        onChanged: (val){
                          setState(() => name = val);
                        },
                        controller: controller.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'groupName',
                          hintText: 'groupName',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter name for creater' : null,
                        onChanged: (val){
                          setState(() => created_by = val);
                        },
                        controller: controller.createdBy,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity_rounded),
                          labelText: 'created by',
                          hintText: 'created by',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              final group = groupModel(
                                name: controller.name.text.trim(),
                                created_by: controller.createdBy.text.trim(),
                              );
                              registerController.instance.createGroup(group);
                              controller.name.clear();
                              controller.createdBy.clear();
                            }
                          },
                          child: Text('Register'.toUpperCase()),
                          style: ElevatedButton.styleFrom(
                            // shape: side: BorderSide.none,
                            shape: StadiumBorder(),
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              // createGroup(
              //   onTap: (){},
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )
    );
  }
}

// class createGroup extends StatelessWidget {
//   const createGroup({
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);
//
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.group),
//                   labelText: 'groupID',
//                   hintText: 'groupID',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextFormField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   labelText: 'groupName',
//                   hintText: 'groupName',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextFormField(
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.fingerprint_rounded),
//                     labelText: 'created by',
//                     hintText: 'created by',
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
//                  ),
//               ),
//               const SizedBox(height: 60),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Get.to(() => loginPage());
//                   },
//                   child: Text('Register'.toUpperCase()),
//                   style: ElevatedButton.styleFrom(
//                    // shape: side: BorderSide.none,
//                     shape: StadiumBorder(),
//                     foregroundColor: Colors.white,
//                     side: const BorderSide(color: Colors.black),
//                     backgroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(vertical: 20),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }