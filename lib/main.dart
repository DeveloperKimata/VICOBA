
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:vicoba_app_final_year_project/payyment/data/model/add_date.dart';
import 'package:vicoba_app_final_year_project/screen/wrapper.dart';
import 'package:vicoba_app_final_year_project/services/auth.dart';
import 'package:vicoba_app_final_year_project/services/auth_repository.dart';


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
  await Firebase.initializeApp().then((value) => Get.put(AuthRepository()));
  runApp(const MyApp());
  initializeFirebase().then((_) {
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData:null,
      child: const GetMaterialApp(
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds:500),
        home: wrapper(),
      ),
    );

  }
}