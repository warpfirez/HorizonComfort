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

  static List<ShoeModel> shoes = <ShoeModel>[
    const ShoeModel(
      id: '0',
      name: 'lebron xiii (13) db doernbecher',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/36064/images/176027/IMG_1859__47325.1614563266.800.800.jpg?c=2',
      pictureUrlCandid:
          'https://lh3.googleusercontent.com/-YID0YAiAUZ8/VlLCOlh5wZI/AAAAAAAEi9w/sG7r-ZR62m4/s600-Ic42/nike-lebron-13-gr-doernbecher-3-01.jpg',
      condition: 'new',
      brand: 'nike',
      size: 36,
      price: 299,
      galleryUrl: {
        '0':
            'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47704/images/239332/IMG_7542__19271.1675291908.800.800.jpg?c=2',
        '1':
            'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47704/images/239333/IMG_7545__52494.1675291908.800.800.jpg?c=2',
        '2':
            'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47704/images/239334/IMG_7543__53722.1675291908.800.800.jpg?c=2',
      },
    ),
    const ShoeModel(
      id: '1',
      name: 'nike sb dunk low pro qs neckface',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47704/images/239332/IMG_7542__19271.1675291908.571.429.jpg?c=2',
      pictureUrlCandid:
          'https://cdn.shopify.com/s/files/1/0549/0405/files/NeckFaceDunk_HighRes_PhotoCoulthard_DSC_7801_IGF_68adefba-9ff3-4cf0-94e0-27bd025c9e15_1024x1024.jpg?v=1666314640',
      condition: 'new',
      brand: 'nike',
      size: 40,
      price: 200,
      galleryUrl: {},
    ),
    const ShoeModel(
      id: '2',
      name: 'nike dunk low lthr / ow off white michigan',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47584/images/238790/IMG_1137__62823.1673987321.800.800.jpg?c=2',
      pictureUrlCandid:
          'https://cdn.sanity.io/images/c1chvb1i/production/fedab4c853597d5e6bf4ffc524c3f0c77d50d395-700x467.jpg?rect=0,36,700,394&w=700&h=394',
      condition: 'new',
      brand: 'nike',
      size: 36,
      price: 599,
      galleryUrl: {},
    ),
    const ShoeModel(
      id: '3',
      name: 'nike dunk low premium sb ms. pacman',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/41920/images/207603/IMG_9135__70647.1644972626.800.800.jpg?c=2',
      pictureUrlCandid:
          'https://i.pinimg.com/736x/fa/92/8d/fa928d8f76577fad1248da31f7dffb2b.jpg',
      condition: 'new',
      brand: 'nike',
      size: 42,
      price: 499,
      galleryUrl: {},
    ),
    const ShoeModel(
      id: '4',
      name: 'yeezy boost 350 v2 beluga reflective 2021',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47533/images/238570/IMG_9058__46691.1673750826.800.800.jpg?c=2',
      pictureUrlCandid:
          'https://www.kicksonfire.com/wp-content/uploads/2021/11/adidas-Yeezy-Boost-350-V2-Beluga-Reflective-GW1229-1.jpeg?x58464',
      condition: 'new',
      brand: 'adidas',
      size: 40,
      price: 899,
      galleryUrl: {},
    ),
    const ShoeModel(
      id: '5',
      name: 'zx 8000 w superearth',
      pictureUrl:
          'https://cdn2.bigcommerce.com/server3500/jxr0taf/products/47837/images/240003/IMG_6250__40172.1676338274.800.800.jpg?c=2',
      pictureUrlCandid:
          'https://tenisufki.eu/storage/default/sean-wotherspoon-adidas-zx-8000-superearth-gz30881.jpeg',
      condition: 'new',
      brand: 'adidas',
      size: 40,
      price: 130,
      galleryUrl: {},
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, pictureUrl, pictureUrlCandid, condition, brand, size, price];
}
