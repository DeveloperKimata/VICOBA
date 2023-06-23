class TExceptions implements Exception{
  //associated error
  final String message;

  //logIn with email and password failure
  const TExceptions([this.message = 'an unknown exception occured.']);

  //create an authentication message
  // from a firebase authentication exception code

  factory TExceptions.fromCode(String code){
    switch(code) {
      case'email exist':
        return const TExceptions('Email exist');
      case'invalid-email':
        return const TExceptions('invalid email/badly formatted');
      case'weak-password':
        return const TExceptions('please enter at least 8 chars');
      case'user-disabled':
        return const TExceptions(
            'this user has been disabled, please contact support for help');
      case'user-not-found':
        return const TExceptions('please create an account');
      case'wrong-password':
        return const TExceptions('incorrect password, please try again later');
      case'too-many-request':
        return const TExceptions('service temporaly blocked');
      case'invalid argument':
        return const TExceptions(
            'invalid argument due to authentication method');
      case'invalid password':
        return const TExceptions('invalid password');
      case'invalid-phoneNumber':
        return const TExceptions('invalid phoneNumber');
      case'operation not allowed':
        return const TExceptions(
            'The provided signIn provider is disable for your firebase project');
      case'session cookie expire':
        return const TExceptions('The provided firebase session cookie expire');
      case'userID exist':
        return const TExceptions('userID exist');
      default:
        return const TExceptions();

    }
  }
}