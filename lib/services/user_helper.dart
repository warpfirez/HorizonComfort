import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserHelper {
  static Future<void> registerUser(
      {required String email, required String password}) async {
    if (_validateCredentials(email: email, password: password) == true) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((value) => debugPrint("User Added"));
      } catch (e) {
        print(e);
      }
    } else {
      debugPrint("Validation fail");
    }
  }

  static bool _validateCredentials(
      {required String? email, required String? password}) {
    if (email == null || password == null) {
      return false;
    } else if (password.length < 8) {
      return false;
    } else {
      return true;
    }
  }
}
