import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ShoeModel extends Equatable {
  final String id;
  final String? name;
  final String? pictureUrl;
  final String? pictureUrlCandid;
  final Map<String, dynamic>? galleryUrl;
  final String? condition;
  final String? brand;
  final int? size;
  final int? price;

  const ShoeModel({
    required this.id,
    required this.pictureUrlCandid,
    required this.name,
    required this.pictureUrl,
    required this.galleryUrl,
    required this.condition,
    required this.brand,
    required this.size,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pictureUrlCandid': pictureUrlCandid,
      'name': name,
      'pictureUrl': pictureUrl,
      'galleryUrl': galleryUrl,
      'condition': condition,
      'brand': brand,
      'size': size,
      'price': price,
    };
  }

  factory ShoeModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    return ShoeModel(
      id: snap.id,
      name: snap.data()!["name"] as String?,
      pictureUrl: snap.data()!["pictureUrl"] as String?,
      pictureUrlCandid: snap.data()!["pictureUrlCandid"] as String?,
      condition: snap.data()!["condition"] as String?,
      brand: snap.data()!["brand"] as String?,
      size: snap.data()!["size"] as int?,
      price: snap.data()!["price"] as int?,
      galleryUrl: snap.data()!["galleryUrl"] as Map<String, dynamic>?,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, pictureUrl, pictureUrlCandid, condition, brand, size, price];
}
