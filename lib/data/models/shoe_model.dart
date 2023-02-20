import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ShoeModel extends Equatable {
  final String id;
  final String name;
  final String pictureUrl;
  final String color;
  final String company;
  final double size;
  final double price;

  const ShoeModel({
    required this.name,
    required this.id,
    required this.pictureUrl,
    required this.color,
    required this.company,
    required this.size,
    required this.price,
  });

  static ShoeModel fromSnapshot(DocumentSnapshot snap) {
    ShoeModel shoe = ShoeModel(
      id: snap.id,
      name: snap['name'],
      pictureUrl: snap['pictureUrl'],
      color: snap['color'],
      company: snap['company'],
      size: snap['size'],
      price: snap['price'],
    );
    return shoe;
  }

  static List<ShoeModel> shoes = <ShoeModel>[
    const ShoeModel(
      id: '1',
      name: 'Classic Leather',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/4f37fca8-6bce-43e7-ad07-f57ae3c13142/air-force-1-07-mens-shoes-5QFp5Z.png',
      color: 'black',
      company: 'Reebok',
      size: 36,
      price: 299,
    ),
    const ShoeModel(
      id: '2',
      name: 'Club C 85 Vintage',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7324a2c5-414a-45ab-8572-6cfb29401d30/air-jordan-1-mid-womens-shoes-Kg3nnj.png',
      color: 'black',
      company: 'Reebok',
      size: 40,
      price: 499,
    ),
    const ShoeModel(
      id: '2',
      name: 'Club C 85 Vintage',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7324a2c5-414a-45ab-8572-6cfb29401d30/air-jordan-1-mid-womens-shoes-Kg3nnj.png',
      color: 'black',
      company: 'Reebok',
      size: 40,
      price: 499,
    ),
    const ShoeModel(
      id: '2',
      name: 'Club C 85 Vintage',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7324a2c5-414a-45ab-8572-6cfb29401d30/air-jordan-1-mid-womens-shoes-Kg3nnj.png',
      color: 'black',
      company: 'Reebok',
      size: 40,
      price: 499,
    ),
    const ShoeModel(
      id: '2',
      name: 'Club C 85 Vintage',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7324a2c5-414a-45ab-8572-6cfb29401d30/air-jordan-1-mid-womens-shoes-Kg3nnj.png',
      color: 'black',
      company: 'Reebok',
      size: 40,
      price: 499,
    ),
    const ShoeModel(
      id: '2',
      name: 'Club C 85 Vintage',
      pictureUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7324a2c5-414a-45ab-8572-6cfb29401d30/air-jordan-1-mid-womens-shoes-Kg3nnj.png',
      color: 'black',
      company: 'Reebok',
      size: 40,
      price: 499,
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [id, pictureUrl, color, company, size];
}
