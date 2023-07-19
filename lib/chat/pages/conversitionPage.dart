import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/chat/pages/groupInfo.dart';
import 'package:vicoba_app_final_year_project/chat/widget/msgTile.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class conversitionPage extends StatefulWidget {
  String userName;
  String groupId;
  String groupName;
  conversitionPage({Key? key, required this.userName, required this.groupName, required this.groupId}) : super(key: key);

  @override
  State<conversitionPage> createState() => _conversitionPageState();
}

class _conversitionPageState extends State<conversitionPage> {
  Stream<QuerySnapshot> ? chats;
  TextEditingController msgController = TextEditingController();
  String admin = '';
  @override
  void initState() {
    getChatandAdmin();
    super.initState();
  }

  getChatandAdmin(){
    DatabaseService().getChats(widget.groupId).then((val){
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val){
      setState(() {
        admin = val;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: (){
            nextScreen(context, groupInfo(
            groupId: widget.groupId,
    groupName: widget.groupName,
    adminName: admin,));
          }, icon: Icon(Icons.info_outline))
        ],
      ),
      body: Stack(
        children:[
          // chat message here
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[700],
              child: Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: msgController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Send a message...',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  )),
                  SizedBox(width: 12,),
                  GestureDetector(
                    onTap: (){
                      sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Icon(Icons.send, color: Colors.white,),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  chatMessages(){
    return StreamBuilder(
        stream: chats,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData? ListView.builder(
            itemCount: snapshot.data.docs.length,
              itemBuilder: (content, index){
              return msgTile(
                  message: snapshot.data.docs[index]['message'],
                  sender: snapshot.data.docs[index]['sender'],
                  sendByMe: widget.userName == snapshot.data.docs[index]['sender']);
              }): Container();
        });
  }
  sendMessage(){
    if(msgController.text.isNotEmpty){
      Map<String, dynamic> chatMessageMap = {
        'message':msgController.text,
        'sender':widget.userName,
        'time':DateTime.now().millisecondsSinceEpoch
      };

      DatabaseService().sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        msgController.clear();
      });
    }
  }
}
