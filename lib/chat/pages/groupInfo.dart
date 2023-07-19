import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/chat/pages/chatPage.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class groupInfo extends StatefulWidget {
  String groupId;
  String groupName;
  String adminName;
  groupInfo({Key? key, required this.groupId, required this.groupName, required this.adminName}) : super(key: key);

  @override
  State<groupInfo> createState() => _groupInfoState();
}

class _groupInfoState extends State<groupInfo> {
  Stream ? members;
  @override
  void initState() {
    getMembers();
    super.initState();
  }

  getMembers() async{
    DatabaseService(uid:  FirebaseAuth.instance.currentUser!.uid).getGroupMembers(widget.groupId).then((val){
      setState(() {
        members = val;
      });
    });
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
        actions: [
          IconButton(onPressed: (){
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('Exit'),
                    content: Text('are you sure you want to exit the group?'),
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          icon:Icon(Icons.cancel, color: Colors.red,) ),
                      IconButton(onPressed: () async{
                       DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).toggleGroupJoin(
                           widget.groupId,
                           getName(widget.adminName),
                           widget.groupName).whenComplete((){
                          nextScreenReplace(context, chatPage());
                       });
                      },
                          icon:Icon(Icons.done, color: Colors.green,) ),
                    ],
                  );
                });
          },
              icon: const Icon(Icons.exit_to_app,))
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text('Group Info', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                    child: Text(widget.groupName.substring(0,1).toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.white),),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Group: ${widget.groupName}",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 5,),
                      Text('Admin: ${getName(widget.adminName)}', style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  )
                ],
              ),
            ),
      memberList(),
          ],
        ),
      ),
    );
  }
  memberList(){
    return StreamBuilder(
      stream: members,
        builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          if(snapshot.data['members'] != null){
            if(snapshot.data['members'].length !=0){
              return ListView.builder(
                itemCount: snapshot.data['members'].length,
                  shrinkWrap:  true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange,
                          child: Text(getName(snapshot.data['members'][index]).substring(0,1)
                          .toUpperCase(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                          )),
                        ),
                        title: Text(getName(snapshot.data['members'][index])),
                        subtitle: Text(getId(snapshot.data['members'][index])),
                      ),
                    );
                  },
                    );
            }else{
              return Center(child: Text('there is no any member in this group'),);
            }
          }else{
            return Center(child: Text('there is no any member in this group'),);
          }
        }else{
          return Center(child: CircularProgressIndicator(color: Colors.orange,),);
        }
        }
    );
  }
}
