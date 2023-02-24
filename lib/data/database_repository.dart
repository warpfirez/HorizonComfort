import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'models/user_model.dart';

import '../utilities/network.dart';
import 'models/user_model.dart';

class DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference shoes = FirebaseFirestore.instance.collection('shoes');

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
    return UserModel(
      id: FirebaseAuth.instance.currentUser?.uid,
      email: FirebaseAuth.instance.currentUser?.email,
      favorites: [],
    );
  }

  Future<List<ShoeModel>> fetchShoes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection("shoes").get();

    List<ShoeModel> allShoes = [];
    for (var document in snapshot.docs) {
      ShoeModel object = ShoeModel.fromDocumentSnapshot(document);
      allShoes.add(object);
    }

    return Future.delayed(const Duration(milliseconds: 500), () {
      return allShoes;
    });
  }
}
