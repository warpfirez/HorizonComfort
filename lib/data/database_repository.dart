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

  Future<void> addUser({
    required String email,
    required String fullName,
    required String phoneNumber,
    List<String> favouritesIds = const [],
    List<String> cartIds = const [],
  }) async {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(
          {
            'email': email,
            'id': FirebaseAuth.instance.currentUser?.uid,
            'fullName': fullName,
            'phoneNumber': phoneNumber,
            'favouritesIds': favouritesIds,
            'cartIds': cartIds,
          },
          // SetOptions(merge: true),
        )
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

  Future<void> updateUser({
    required String newEmail,
    required String newFullName,
    required String newPhone,
  }) async {
    User userAuth = FirebaseAuth.instance.currentUser!;

    await userAuth.updateEmail(newEmail);

    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
          'email': newEmail,
          'fullName': newFullName,
          'phoneNumber': newPhone,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<UserModel> fetchUser(String? id) async {
    var collection = _firebaseFirestore.collection('users');
    var snapshot = await collection.doc(id).get();

    return UserModel.fromDocumentSnapshot(snapshot);
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

  Future<ShoeModel> fetchShoeById(String id) async {
    var collection = _firebaseFirestore.collection('shoes');
    var snapshot = await collection.doc(id).get();

    return ShoeModel.fromDocumentSnapshot(snapshot);
  }

  Future<void> addShoeToUserCart(String? shoeId) {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
          'cartIds': FieldValue.arrayUnion([shoeId])
        })
        .then((value) => print("Added to cart"))
        .catchError((error) => print("Failed adding to cart: $error"));
  }

  Future<void> removeCartItem(String? shoeId) async {
    return users
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
          'cartIds': FieldValue.arrayRemove([shoeId])
        })
        .then((value) => print("Removed from cart"))
        .catchError((error) => print("Failed removing from cart: $error"));
  }
}
