import 'package:firebase_auth/firebase_auth.dart';

class user{

  final String uid;

  user({required this.uid});

}

///refreshes the current user if signed in
Future<void> reload() async{
//  await _delegate.reload();
}

///send a verification email to a user
///The verification process is completed by calling [applyActionCode]

  Future<void> sendEmailVerification([
    ActionCodeSettings ? actionCodeSettings,
]) async{
 // await delegate.sendEmailVerification(actionCodeSettings);
  }

  ///unlink a provider free a user account
///A [FirebaseAuthException] maybe thrown with the following error code

 //  Future <user> unlink(String provider) async{
 // // return user._(_auth, await _delegate.unlink(providerId));
 //  }