import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'models/user_model.dart';

import '../utilities/network.dart';
import 'models/user_model.dart';

class DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String email) {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({'email': email, 'age': 18})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteUser() {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> updateUser() {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({'new field': 'new data'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<UserModel> fetchUser() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return UserModel(
          id: FirebaseAuth.instance.currentUser?.uid,
          email: FirebaseAuth.instance.currentUser?.email,
          favorites: [],
        );
      },
    );
  }
}
