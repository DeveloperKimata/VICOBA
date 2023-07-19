import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/chat/pages/searchPage.dart';
import 'package:vicoba_app_final_year_project/chat/widget/group_tile.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/loginPage.dart';
import 'package:vicoba_app_final_year_project/screen/home/profile/profile_screen.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/auth_services.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  State<chatPage> createState() => _chatPageChatState();
}

class _chatPageChatState extends State<chatPage> {
  String userName = "";
      String email = "";
  String memberID = "";
  String userType = "";
  String phoneNumber = "";

  AuthService _auth = AuthService();

    Stream? groups;
    bool _isLoading = false;
    String groupName = '';

 @override
  void initState() {
    super.initState();
    getUserData();
  }

  //string manipulation
  String getId(String res){
   return res.substring(0, res.indexOf("_"));
  }

  String getName(String res){
   return res.substring(res.indexOf("_")+1);
  }

  getUserData() async{
   await helperFunctions.getUserEmailFromSF().then((value){
     setState(() {
       email = value!;
     });
   });
   await helperFunctions.getUserNameFromSF().then((value){
     setState(() {
       userName = value!;
     });
   });
   //getting the list of snapshots in our stream
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).getUserGroups().then((snapshot){
      setState(() {
        groups = snapshot;
      });
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            nextScreenReplace(context, const searchPage());
          },icon: const Icon(Icons.search,))
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text('ifmsoChat', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 70),
          child: ListView(
            padding:  EdgeInsets.symmetric(horizontal: 20,),
            children: <Widget>[
              Icon(Icons.account_circle,
              size: 150,
              color: Colors.grey[700],),
              const SizedBox(height: 15,),
              Text(userName, textAlign: TextAlign.center,style: const TextStyle(
                fontWeight: FontWeight.bold
              ),),
              Text(email, textAlign: TextAlign.center,style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 30,),
              Divider(height: 2,),
              ListTile(
                onTap: (){
                  Get.to(()=>Bottom());
                },
                selectedColor: Colors.orangeAccent,
                selected: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: Icon(Icons.home),
                title: Text('Home', style: TextStyle(
                  color: Colors.black
                ),),
              ),
              ListTile(
                onTap: (){
                  nextScreenReplace(context, profileScreen(
                    userName: userName,
                    email: email,
                    memberID: memberID,
                    userType: userType,
                    phoneNumber: phoneNumber,
                  ));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: Icon(Icons.person),
                title: Text('Profile', style: TextStyle(
                    color: Colors.black
                ),),
              ),
              // ListTile(
              //   onTap: (){},
              //   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   leading: Icon(Icons.account_balance_wallet_outlined),
              //   title: Text('myWallet', style: TextStyle(
              //       color: Colors.black
              //   ),),
              // ),
              ListTile(
                onTap: (){
                  showDialog(
                    barrierDismissible: false,
                      context: context,
                      builder: (context){
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('are you sure you want to logout?'),
                      actions: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            icon:Icon(Icons.cancel, color: Colors.red,) ),
                        IconButton(onPressed: () async{
                          await _auth.signOut();
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (context) => loginPage()),
                          (route) => false);
                        },
                            icon:Icon(Icons.done, color: Colors.green,) ),
                      ],
                    );
                      });
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: Icon(Icons.exit_to_app),
                title: Text('logOut', style: TextStyle(
                    color: Colors.black
                ),),
              )
            ],
          ),
        ),
      ),
      body: groupList(),
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        onPressed: (){
          popUpDialog(context);
        },
        elevation: 0,
        backgroundColor: Colors.orange,
        child: Icon(Icons.groups,color: Colors.white, size: 30,),
      ),
    );
  }

  popUpDialog(BuildContext context){
   showDialog(
     barrierDismissible: false,
       context: context,
       builder: (context){
         return StatefulBuilder(
           builder: ((context, setState){
           return AlertDialog(
             title: Text('Create a group', textAlign: TextAlign.left,),
             content: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 _isLoading == true ?
                 Center(child: CircularProgressIndicator(color: Colors.orange,),):
                     TextField(
                       onChanged: (val){
                         setState(() {
                           groupName = val;
                         });
                       },
                       style: TextStyle(color: Colors.black),
                       decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.orange),
                           borderRadius: BorderRadius.circular(30),
                         ),
                           errorBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.red),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.orange),
                             borderRadius: BorderRadius.circular(30),
                           )
                       ),
                     ),
               ],
             ),
             actions: [
               ElevatedButton(
                 onPressed: (){
                   Navigator.of(context).pop();
                 },
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),child: Text('CANCEL'),
               ),
               ElevatedButton(
                 onPressed: (){
                   if(groupName != null){
                     setState(() {
                       _isLoading = true;
                     });
                       DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                           .createGroup(userName,
                           FirebaseAuth.instance.currentUser!.uid, groupName)
                           .whenComplete((){
                         _isLoading = false;
                       });
                       Navigator.of(context).pop();
                       showSnackbar(context, Colors.green, "Group created successfully.");
                   }
                 },
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),child: Text('CREATE'),
               ),
             ],
           );
           }),
         );
       });
  }

  groupList(){
   return StreamBuilder(
     stream: groups,
     builder: (context, AsyncSnapshot snapshot){
       // make some checks
       if(snapshot.hasData){
         if(snapshot.data['groups'] != null){
           if(snapshot.data['groups'].length != 0){
             return ListView.builder(
               itemCount: snapshot.data['groups'].length,
                 itemBuilder: (context, index){
                   //int reverseIndex = snapshot.data['groups'].length-index-1;
                 return groupTile(
                     userName: snapshot.data['userName'],
                     groupId: getId(snapshot.data['groups'][index]),
                     groupName: getName(snapshot.data['groups'][index]));
                 }
             );
           }else{
             return noGroupWidget();
           }
         }else{
           return noGroupWidget();
         }
       }else{
         return Center(child: CircularProgressIndicator(
           color: Colors.orangeAccent,
         ),);
       }
     },
   );
  }

  noGroupWidget(){
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 25),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         GestureDetector(
           onTap: (){
             popUpDialog(context);
           },
             child: Icon(Icons.groups, color: Colors.grey[700], size: 75,)),
         const SizedBox(height: 20,),
         Text("You've not joined any group, tap on the groups icon to create a group or search from top search button.",
         textAlign: TextAlign.center,)
       ],
     ),
   );
  }
}
