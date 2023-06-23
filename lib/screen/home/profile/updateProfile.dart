import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/profileController.dart';

class updateProfile extends StatelessWidget {
  const updateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Center(child: const Text('Edit Profile',
                    style: TextStyle(color: Colors.black,
                        fontSize: 20,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 10),
              /// future Builder to load cloud data
              FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      userModel user = snapshot.data as userModel;


                      // controller
                      final userName =  TextEditingController(text: user.userName);
                      final password =  TextEditingController(text: user.password);
                      final phoneNumber =  TextEditingController(text: user.phoneNumber);
                      final email =  TextEditingController(text: user.email);


                      return Column(
                        /// step 4 - wrap this widget with futureBuilder
                        children: [
                          Stack(
                            children: [
                              SizedBox(

                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(image: AssetImage("images/2.jpg"),),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.yellowAccent,
                                  ),
                                  child: Icon(Icons.camera_alt_outlined, color: Colors.black,size: 20,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Form(child: Column(
                            children: [
                              TextFormField(
                                controller: userName,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'userName',
                                  hintText: 'userName',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.fingerprint_rounded),
                                    labelText: 'password',
                                    //hintText: 'password',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                                    suffixIcon: IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.remove_red_eye_sharp))),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: phoneNumber,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: 'phoneNumber',
                                  hintText: 'phoneNumber',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_sharp),
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                              SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async{
                                    final userData = userModel(
                                      userName: userName.text.trim(),
                                      password: password.text.trim(),
                                      phoneNumber: phoneNumber.text.trim(),
                                      email: email.text.trim(),
                                    );

                                    await controller.updateRecord(userData);

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    side: BorderSide.none,
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text('Edit Profile',style: TextStyle(fontSize: 15,color: Colors.black),),
                                ),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Joined 11 June 2023', style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),),
                                  ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: StadiumBorder(),
                                        side: BorderSide.none,
                                      ),
                                      child: Text('Delete',style: TextStyle(
                                        fontSize: 20,
                                      ),))
                                ],
                              )
                            ],
                          ))
                        ],
                      );
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }else{
                      return Center(child: Text('Something went wrong'),);
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
