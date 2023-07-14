import 'package:firebase_auth/firebase_auth.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login


//register
Future registerUserWithEmailandPassword(
    String email, String password, String memberID, String groupName, String userType, String userName, String phoneNumber) async{
  try{
    User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password))
        .user!;
    if(user != null){
      //call our db service to update the user data
      await DatabaseService(uid: user.uid).updateUserData(email, password, memberID, groupName, userType, userName, phoneNumber);
      return true;
    }
  }on FirebaseAuthException catch(e){
    return e.message;
  }
}
//signout
Future signOut() async{
  try{
    await helperFunctions.saveUserLoggedInStatus(false);
    await helperFunctions.saveUserEmailSF("");
    await helperFunctions.saveUserNameSF("");

    await firebaseAuth.signOut();
  }catch(e){
    return null;
  }
}

}