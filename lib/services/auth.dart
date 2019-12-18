import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gusc/pages/auth/user.dart';

class AuthService {
  final FirebaseAuth _mAuth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _mAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  
  Future signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await _mAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      AuthResult result = await _mAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _mAuth.signOut();
    } catch (e) {
      log(e);
    }
    return null;
  }
}
