import 'dart:convert';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      // setState((){
      info = json.decode(value);
      // });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.white70,
          onPressed: null,
          tooltip: 'floating',
          child: Image(image: AssetImage('images/forum_chat.png'),height: 30,width: 30,)),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white38,
                Colors.blueGrey,
                Colors.black26,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 10,
                  color: Colors.transparent)
            ]),
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "VICOBA",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                      3,
                      (index) => Transform.translate(
                            offset: Offset((-10 * index).toDouble(), 0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/${index + 1}.jpg"),
                            ),
                          )),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (2.toDouble() / 2).toInt(),
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          Container(
                            width: 300,
                            height: 250,
                            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black45,
                                    Colors.blueGrey,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                  BoxShadow(
                                      offset: Offset(-3, -5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                ]),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Shares",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(height: 80),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.attach_money,
                                              size: 20, color: Colors.white),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "3,000,000 per share",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black45,
                                                  blurRadius: 10,
                                                  offset: Offset(2, 4))
                                            ]),
                                        child: const Icon(
                                          Icons.payments_outlined,
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 250,
                            margin: const EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black45,
                                    Colors.blueGrey,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                  BoxShadow(
                                      offset: Offset(-3, -5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                ]),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Social Funds",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(height: 80),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.attach_money,
                                              size: 20, color: Colors.white),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "3,000,000 per share",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black45,
                                                  blurRadius: 10,
                                                  offset: Offset(2, 4))
                                            ]),
                                        child: const Icon(
                                          Icons.payments_outlined,
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: info.length,
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          Container(
                            width: 370,
                            height: 100,
                            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black45,
                                    Colors.blueGrey,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                  BoxShadow(
                                      offset: Offset(-3, -5),
                                      blurRadius: 10,
                                      color: Colors.blueGrey),
                                ]),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    info[index]["title"],
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// actions: <Widget>[
//   TextButton.icon(
//       icon:Icon(Icons.person),
//       label: Text('logout'),
//       onPressed:() async{
//         await _auth.signOut();
//       }
//   )
// ],
