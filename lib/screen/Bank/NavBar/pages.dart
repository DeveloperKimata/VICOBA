import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/screen/Bank/bankerPage.dart';
import 'package:vicoba_app_final_year_project/screen/Bank/profile.dart';

class bottomPage extends StatefulWidget {
  const bottomPage({Key? key}) : super(key: key);

  @override
  State<bottomPage> createState() => _bottomPageState();
}

class _bottomPageState extends State<bottomPage> {
  int _selectedIndex = 0;
  List<Widget> pages = <Widget>[

    const Bank(),
    const profile(),
  ];
  void _onIteamTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor:
          Colors.orange,
          currentIndex: _selectedIndex,
          onTap: _onIteamTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
