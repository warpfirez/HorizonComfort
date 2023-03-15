import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/data/models/user_model.dart';

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

  Future<UserModel> fetchUser() async {
    var collection = _firebaseFirestore.collection('users');
    var snapshot =
        await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    return UserModel.fromMap(snapshot.data()!);
  }

  Future<List<ShoeModel>> fetchShoes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection("shoes").get();

    List<ShoeModel> allShoes = [];
    for (var document in snapshot.docs) {
      ShoeModel object = ShoeModel.fromMap(document.data());
      allShoes.add(object);
    }

    return allShoes;
  }

  Future<List<ShoeModel>> fetchShoesByPopularity() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
        .collection("shoes")
        .orderBy('popularity')
        .get();

    List<ShoeModel> shoesPopular = [];
    for (var document in snapshot.docs) {
      ShoeModel object = ShoeModel.fromMap(document.data());
      shoesPopular.insert(0, object);
    }

    return shoesPopular;
  }

  Future<ShoeModel> fetchShoeById(String id) async {
    var collection = _firebaseFirestore.collection('shoes');
    var snapshot = await collection.doc(id).get();

    return ShoeModel.fromMap(snapshot.data()!);
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

  Future<void> updateUserFavorite({required String shoeId}) async {
    var collection = _firebaseFirestore.collection('users');
    var snapshot =
        await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    var user = UserModel.fromMap(snapshot.data()!);

    if (user.favouritesIds.contains(shoeId)) {
      await decreaseShoePopularity(shoeId: shoeId);
      return users
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
            'favouritesIds': FieldValue.arrayRemove([shoeId])
          })
          .then((value) => print("Removed from favourites"))
          .catchError(
              (error) => print("Failed removing from favourites: $error"));
    } else {
      increaseShoePopularity(shoeId: shoeId);
      return users
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
            'favouritesIds': FieldValue.arrayUnion([shoeId])
          })
          .then((value) => print("Added to favourites"))
          .catchError((error) => print("Failed adding to favourites: $error"));
    }
  }

  Future<void> increaseShoePopularity({required String shoeId}) async {
    await shoes
        .doc(shoeId)
        .update({"popularity": FieldValue.increment(1)})
        .then((value) => print("Incremented shoe popularity"))
        .catchError((error) => print("Failed incrementing shoe popularity"));
  }

  Future<void> decreaseShoePopularity({required String shoeId}) async {
    await shoes
        .doc(shoeId)
        .update({"popularity": FieldValue.increment(-1)})
        .then((value) => print("Decrementing shoe popularity"))
        .catchError((error) => print("Failed decrementing shoe popularity"));
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

  Future<List<ShoeModel>> filterShoes({required String name}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection("shoes").get();

    List<ShoeModel> filteredShoes = [];

    for (var document in snapshot.docs) {
      ShoeModel object = ShoeModel.fromMap(document.data());
      if (object.name!.contains(name)) {
        filteredShoes.add(object);
      }
    }

    return filteredShoes;
  }
}
