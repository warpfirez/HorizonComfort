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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'favouritesIds': favouritesIds,
      'cartIds': cartIds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      favouritesIds: map['favouritesIds'] as List<dynamic>,
      cartIds: map['cartIds'] as List<dynamic>,
    );
  }

  @override
  List<Object?> get props =>
      [id, email, fullName, phoneNumber, favouritesIds, cartIds];
}
