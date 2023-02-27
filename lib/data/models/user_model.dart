import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final List<dynamic> favouritesIds;
  final List<dynamic> cartIds;

  const UserModel({
    required this.id,
    required this.email,
    required this.favouritesIds,
    required this.cartIds,
  });

  static UserModel fromDocumentSnapshot(DocumentSnapshot snap) {
    UserModel user = UserModel(
      id: snap.id,
      email: snap['email'],
      favouritesIds: snap['favouritesIds'],
      cartIds: snap['cartIds'],
    );
    return user;
  }

  @override
  List<Object?> get props => [id, email, favouritesIds];
}
