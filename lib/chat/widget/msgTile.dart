import 'package:flutter/material.dart';

class msgTile extends StatefulWidget {
  String message;
  String sender;
  bool sendByMe;
   msgTile({Key? key, required this.message, required this.sender, required this.sendByMe}) : super(key: key);

  @override
  State<msgTile> createState() => _msgTileState();
}

class _msgTileState extends State<msgTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4, left: widget.sendByMe?0:25,right: widget.sendByMe?25:0),
      alignment: widget.sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: widget.sendByMe ? EdgeInsets.only(left: 30): EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20,right: 20),
        decoration: BoxDecoration(
          borderRadius: widget.sendByMe ? BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ):
          BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
          color: widget.sendByMe ? Colors.orange:Colors.grey[400]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.sender.toUpperCase(),textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: - 0.5
            ),
            ),
            SizedBox(height: 8,),
            Text(widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
            ),)
          ],
        ),
      ),
    );
  }
}
