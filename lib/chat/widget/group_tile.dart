import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/chat/pages/conversitionPage.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';

class groupTile extends StatefulWidget {
  String userName;
  String groupId;
  String groupName;
  groupTile({Key? key, required this.userName, required this.groupId, required this.groupName}) : super(key: key);

  @override
  State<groupTile> createState() => _groupTileState();
}

class _groupTileState extends State<groupTile> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        nextScreen(context, conversitionPage(userName: widget.userName, groupName: widget.groupName, groupId: widget.groupId,));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange,
            child: Text(widget.groupName.substring(0,1).toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
          title: Text(widget.groupName, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Join the conversition as ${widget.userName}", style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  }
}
