import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  Sign in Anonymously
  Future signInAnon () async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //  print('is he anonymous ${user.isAnonymous}');
      return user;
    } catch(e) {
      print('This is the error ${e.toString()}');
      return null;
    }
  }

  //  Sign in with Email and password

  //  Register with Email and password

  //  Sign out
}