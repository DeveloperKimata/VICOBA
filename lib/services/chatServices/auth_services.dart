import 'package:firebase_auth/firebase_auth.dart';
import 'package:vicoba_app_final_year_project/chat/helper/helperFunction.dart';
import 'package:vicoba_app_final_year_project/services/chatServices/db_services.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login
  Future loginInWithUserNameandPassword(String password, String email) async{
    try{
      User user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password,)).user!;
      if(user != null){
        //call our db service to update the user data
        return true;
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
//register
Future registerUserWithEmailandPassword(
    String memberID, String userType, String userName,
    String password, String phoneNumber, String email) async{
  try{
    User user = (await firebaseAuth.createUserWithEmailAndPassword(
        password: password,
      email: email))
        .user!;
    if(user != null){
      //call our db service to update the user data
      await DatabaseService(uid: user.uid).savingUserData(memberID, userType, userName, password, phoneNumber, email);
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
    await helperFunctions.saveMemberIdSF("");
    await helperFunctions.saveUserTypeSF("");
    await helperFunctions.saveUserNameSF("");
    await helperFunctions.savePhoneNumberSF("");
    await helperFunctions.saveUserEmailSF("");

    await firebaseAuth.signOut();
  }catch(e){
    return null;
  }
}

}