import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/payyment/data/model/add_date.dart';
import 'package:vicoba_app_final_year_project/screen/wrapper.dart';
import 'package:vicoba_app_final_year_project/services/auth.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';
import 'package:vicoba_app_final_year_project/shared/constants.dart';


Future<void>initializeFirebase() async{
  if(Firebase.apps.isEmpty){
    var DefaultFirebaseOptions;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    ///run the initialization for web
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId));
    runApp(const MyApp());
  }else{
    ///run the initialization for android, ios
    await Firebase.initializeApp();
}

runApp(const MyApp());
  }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
bool _isSignedIn = false;
  @override
  void initState(){
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus() async{
    await helperFunctions.getUserLoggedInStatus().then((value){
      if(value != null){
        _isSignedIn = value;
      }
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData:null,
      child: const GetMaterialApp(
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds:500),
          debugShowCheckedModeBanner: false,
          home: wrapper(),
      ),
    );

  }
}