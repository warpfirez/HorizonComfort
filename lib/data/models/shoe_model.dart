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
  final int? popularity;
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
    required this.popularity,
    required this.size,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pictureUrl': pictureUrl,
      'pictureUrlCandid': pictureUrlCandid,
      'galleryUrl': galleryUrl,
      'condition': condition,
      'brand': brand,
      'popularity': popularity,
      'size': size,
      'price': price,
    };
  }

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      pictureUrl: map['pictureUrl'] as String,
      pictureUrlCandid: map['pictureUrlCandid'] as String,
      galleryUrl: map['galleryUrl'] as Map<String, dynamic>,
      condition: map['condition'] as String,
      brand: map['brand'] as String,
      popularity: map['popularity'] as int,
      size: map['size'] as int,
      price: map['price'] as int,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        pictureUrl,
        pictureUrlCandid,
        condition,
        brand,
        popularity,
        size,
        price
      ];
}
