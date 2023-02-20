import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final List<dynamic> favorites;

  const UserModel({
    required this.id,
    required this.email,
    required this.favorites,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    UserModel user = UserModel(
      id: snap.id,
      email: snap['email'],
      favorites: snap['favorites'],
    );
    return user;
  }

  @override
  List<Object?> get props => [id, favorites];
}
