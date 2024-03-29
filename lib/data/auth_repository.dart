import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/snackbar.dart';

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      // pass firebaseAuth in case its null create new instance
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  // stream informing whether something changed in the user object
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential =
          await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      showSB(
          title: 'Success!',
          message: 'You have been signed out',
          titleColor: Colors.green);
    } catch (e) {
      print(e);
    }
  }
}

class NetworkException implements Exception {}
