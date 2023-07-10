import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vicoba_app_final_year_project/payyment/widgets/bottomnavigationbar.dart';
import 'package:vicoba_app_final_year_project/screen/authenticate/authenticate.dart';
import 'package:vicoba_app_final_year_project/services/exceptions/signUp_email_pwd_failure.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  //variables
final FirebaseAuth _auth = FirebaseAuth.instance;
late final Rx<User?> firebaseUser;
var verification = ''.obs;

@override
  void onReady(){
  Future.delayed(Duration(seconds: 6));
  firebaseUser = Rx<User?> (_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges());
  ever(firebaseUser, _setInitialScreen);
}

_setInitialScreen(User? user){
  user == null? Get.offAll(() => Authenticate()) : Get.offAll(() => Bottom());
}

 Future<void> phoneAuthentication(String phoneNumber) async{
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
      verificationCompleted: (credential) async{
      await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e){
      if(e.code == 'invalid-phone-number'){
        Get.snackbar('error', 'the provider phone number is not valid.');
      }else{
        Get.snackbar('error', 'something went wrong, try again.');
      }
      },
      codeSent: (verificationId, resendToken){
      this.verification.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId){
        this.verification.value = verificationId;
      });
}


//creating phoneAuthCredential object
Future <bool> verifyOTP(String otp) async{
  var credential = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(verificationId:this.verification.value, smsCode:otp));
  return credential.user != null ? true : false;
}

Future<void> createUserWithEmailAndPassword(String email, String password) async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null? Get.offAll(() => Bottom()) : Get.offAll(() => Authenticate());
  }on FirebaseAuthException catch(e) {
    final ex = signUpWithEmailAndPasswordFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
  }catch(_){
    var ex =  signUpWithEmailAndPasswordFailure();
    print('EXCEPTION - ${ex.message}');
    throw ex;
  }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){}
    catch(_){}
  }

  Future<void> logout() async => await _auth.signOut();
}

