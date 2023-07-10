import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/profileController.dart';

class usersDetails extends StatelessWidget {
  const usersDetails({Key? key}) : super(key: key);

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
                  Center(child: const Text('Group Members',
                    style: TextStyle(color: Colors.black,
                        fontSize: 20,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 10),
              FutureBuilder<List<userModel>>(
                future: controller.getAllUser(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c,index){
                          return Column(
                            children: [
                              ListTile(
                                iconColor: Colors.orange,
                                tileColor: Colors.orange.withOpacity(0.1),
                                leading: Icon(Icons.person),
                                title: Text('${snapshot.data![index].userName}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].phoneNumber ?? ''),
                                    Text(snapshot.data![index].email ?? ''),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
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
