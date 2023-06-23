 import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/models/userModel.dart';
import 'package:vicoba_app_final_year_project/screen/controller/signUp_controller.dart';
import 'package:vicoba_app_final_year_project/services/database.dart';
import 'package:vicoba_app_final_year_project/services/userRepository.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on firebaseUser
  User? _userFromFirebaseUser(User? user){
    return user != null ? user:null;
  }
  //auth change user stream
   Stream<User?> get user{
    return _auth.authStateChanges().map<User?>((User? user) => _userFromFirebaseUser(user));
   }
  //sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with user information
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //register with group_id, groupName and created by
  Future registerWithEmailAndPassword(String password, String email) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email, password:password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign out
   Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
   }
}
