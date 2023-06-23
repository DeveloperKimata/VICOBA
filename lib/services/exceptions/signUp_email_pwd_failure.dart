class signUpWithEmailAndPasswordFailure{
  final String message;
  signUpWithEmailAndPasswordFailure([this.message = "unknown error occurred."]);

  factory signUpWithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case'weak-password':
        return signUpWithEmailAndPasswordFailure(
            'Please enter strong password.');
      case'invalid-email':
        return signUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case'email-already-in-use':
        return signUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case'operation-not-allowed':
        return signUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support');
      case'user-disable':
        return signUpWithEmailAndPasswordFailure(
            'Please enter strong password. Please contact support for help');
      default:
        return signUpWithEmailAndPasswordFailure();
    }
  }
}