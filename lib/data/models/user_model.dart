import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final List<dynamic> favouritesIds;
  final List<dynamic> cartIds;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.favouritesIds,
    required this.cartIds,
  });

  static UserModel fromDocumentSnapshot(DocumentSnapshot snap) {
    UserModel user = UserModel(
      id: snap.id,
      email: snap['email'],
      fullName: snap['fullName'],
      phoneNumber: snap['phoneNumber'],
      favouritesIds: snap['favouritesIds'],
      cartIds: snap['cartIds'],
    );
    return user;
  }

  @override
  List<Object?> get props =>
      [id, email, fullName, phoneNumber, favouritesIds, cartIds];
}
