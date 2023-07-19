import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/chat/pages/conversitionPage.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController searchController = TextEditingController();
  bool _isLoading = false;
  QuerySnapshot ? searchSnapshot;
  bool hasUserSearched = false;
  String userName = '';
  bool isJoined = false;
  User? user;

  @override
  void initState() {
    getCurrentUserIdandName();
    super.initState();
  }

  getCurrentUserIdandName() async{
    await helperFunctions.getUserNameFromSF().then((value){
      setState(() {
        userName = value!;
      });
    });
    user = FirebaseAuth.instance.currentUser;
  }
  String getName(String r){
    return r.substring(r.indexOf("_")+1);
  }

  //string manipulation
  String getId(String res){
    return res.substring(0, res.indexOf("_"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios))
        ,
       elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("Search",
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(vertical:10),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(width: 2, color: Colors.white70)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(width: 2, color: Colors.white70)),
                        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        hintText: 'Search groups here...',
                        hintStyle: TextStyle(color: Colors.white,
                        fontSize: 16)
                      ),
                    )),
                GestureDetector(
                  onTap: (){
                    initiateSearchMethod();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(Icons.search, color:Colors.white,),
                  ),
                )
              ],
            ),
          ),
          _isLoading ? Center(child: CircularProgressIndicator(color: Colors.orange,),)
              : groupList(),
        ],
      ),
    );
  }
  initiateSearchMethod() async{
    if(searchController.text.isNotEmpty){
      setState(() {
        _isLoading = true;
      });
      await DatabaseService().searchByName(searchController.text).then((snapshot){
        setState(() {
          searchSnapshot = snapshot;
          _isLoading = false;
          hasUserSearched = true;
        });
      });
    }
  }
  groupList(){
    return hasUserSearched ? ListView.builder(
      shrinkWrap: true,
        itemCount: searchSnapshot!.docs.length,
        itemBuilder: (context, index){
        return group_Tile(
          userName,
          searchSnapshot!.docs[index]['groupId'],
          searchSnapshot!.docs[index]['groupName'],
          searchSnapshot!.docs[index]['admin'],
        );
        }): Container();
  }
  
  joinedOrNot(String userName, String groupId, String groupName, String admin) async{
    await DatabaseService(uid: user!.uid).isUserJoined(groupName, groupId, userName).then((value){
      setState(() {
        isJoined = value;
      });
    });
  }
  Widget group_Tile(String userName, String groupId, String groupName, String admin){
    //function to check whether user already exists in group
     joinedOrNot(userName, groupId, groupName, admin);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.orange,
        child: Text(groupName.substring(0,1).toUpperCase(), style: TextStyle(
          color: Colors.white
        ),),
      ),
      title: Text(groupName, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text("Admin: ${getName(admin)}"),
      trailing: InkWell(
        onTap: () async{
          await DatabaseService(uid: user!.uid).toggleGroupJoin(groupId, userName, groupName);
          if(isJoined){
            setState(() {
              isJoined = !isJoined;
            });
            showSnackbar(context, Colors.green, 'Successfully joined the group');
            Future.delayed(Duration(seconds: 1),(){
              nextScreen(context, conversitionPage(userName: userName, groupName: groupName, groupId: groupId));
            });
          }else{
            setState(() {
              isJoined = !isJoined;
              showSnackbar(context, Colors.red, 'Left the group $groupName');
            });
          }
        },
        child: isJoined ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
            border: Border.all(color: Colors.white, width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Joined',
          style: TextStyle(
            color: Colors.orange
          ),),
        ):Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Join Now',
            style: TextStyle(
                color: Colors.green
            ),),
        ),
      ),
    );
  }
}
