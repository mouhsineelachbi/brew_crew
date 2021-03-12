import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  Create use obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //  Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }
  //  Sign in Anonymously
  Future signInAnon () async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //  print('is he anonymous ${user.isAnonymous}');
      return _userFromFirebaseUser(user);
    } catch(e) {
      print('This is the error ${e.toString()}');
      return null;
    }
  }

  //  Sign in with Email and password

  //  Register with Email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print('Error : ${e.toString()}');
      return null;
    }
  }

  //  Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print('Error : ${e.toString()}');
      return null;
    }
  }
}