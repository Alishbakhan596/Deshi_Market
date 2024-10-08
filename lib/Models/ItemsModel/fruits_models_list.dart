import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String productName;
  final String productDescription;
  final String unitPrice;
  final String images;
  final String? productId;

  ItemModel({
    required this.productName,
    required this.productDescription,
    required this.unitPrice,
    required this.images,
    this.productId,
  });

  factory ItemModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ItemModel(
      productName: data['name'] ?? '',
      productDescription: data['description'] ?? '',
      unitPrice: data['price']?.toString() ?? '',
      images: data['image'] ?? '',
    );
  }
}
