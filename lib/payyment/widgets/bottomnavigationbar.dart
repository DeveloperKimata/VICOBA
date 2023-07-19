
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/chat/pages/chatPage.dart';
import 'package:vicoba_app_final_year_project/payyment/Screens/add.dart';
import 'package:vicoba_app_final_year_project/payyment/Screens/home.dart';
import 'package:vicoba_app_final_year_project/payyment/Screens/statistics.dart';
import 'package:vicoba_app_final_year_project/screen/home/notification.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';

class Bottom extends StatefulWidget {
   Bottom({Key? key, }) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
   String userName = '';
   String email = "";
   String groupName = '';
   Stream? groups;
  int index_color = 0;

  List Screen = [Home(), Statistics(), notification(), chatPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Screen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Colors.orange : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1 ? Colors.orange : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: index_color == 2 ? Colors.orange : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.chat,
                  size: 30,
                  color: index_color == 3 ? Colors.orange : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
