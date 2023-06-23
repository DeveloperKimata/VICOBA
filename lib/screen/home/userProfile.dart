import 'package:flutter/material.dart';

class userProfile extends StatelessWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.white70,

        body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        const CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('images/3.jpg'),
    ),
    const Text(
    'userName',
    style: TextStyle(
    fontSize: 40.0,
    color: Colors.black54,
    fontWeight: FontWeight.bold,
    ),
    ),
          const Text(
            'userEmail',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black54,
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.lightGreen; // Color when the button is pressed
                  } else if (states.contains(MaterialState.disabled)) {
                    return Colors.redAccent; // Color when the button is disabled
                  }
                  return Colors.yellow; // Default color
                }),
              ),
              onPressed: () async {
              },
              child: const Text('Edit Profile',
                style: TextStyle(color:Colors.black),)
          ),
    const SizedBox(height: 20.0,
    width: 150.0,
    child: Divider(
    color: Colors.white,
    ),),
          ]
    )
    )
    )
    );
  }
}
