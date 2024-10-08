import 'package:e_commerce_fruits_app/Models/ItemsModel/fruits_models_list.dart';
import 'package:flutter/material.dart';

class FavouriteItem with ChangeNotifier {
  final List<ItemModel> _itemListOne = [
    ItemModel(
        productId: '1',
        productName: 'Organic Bananas',
        productDescription: '7pcs, Price',
        images: 'assets/Fruits/bananas.png',
        unitPrice: '\$4.99'),
    ItemModel(
        productId: '2',
        productName: 'Red Apple',
        productDescription: '1kg, Price',
        images: 'assets/Fruits/apple.png',
        unitPrice: '\$4.99'),
  ];
  final List<ItemModel> _itemListTwo = [
    ItemModel(
        productId: '3',
        productName: 'Bell Pepper Red',
        productDescription: '1kg, Price',
        images: 'assets/Fruits/shemla.png',
        unitPrice: '\$4.99'),
    ItemModel(
        productId: '4',
        productName: 'Ginger',
        productDescription: '250gm, Price',
        images: 'assets/Fruits/ginger.png',
        unitPrice: '\$4.99'),
  ];
  final List<ItemModel> _itemListThree = [
    ItemModel(
        productId: '5',
        productName: 'Beef Bone',
        productDescription: '1kg, Price',
        images: 'assets/Fruits/beef.png',
        unitPrice: '\$4.99'),
    ItemModel(
        productId: '6',
        productName: 'Boiler Chicken',
        productDescription: '1kg, Price',
        images: 'assets/Fruits/chicken.png',
        unitPrice: '\$4.99'),
  ];

  final Map<String, int> _itemQuantities = {};

  List<ItemModel> get itemListOne => _itemListOne;
  List<ItemModel> get itemListTwo => _itemListTwo;
  List<ItemModel> get itemListThree => _itemListThree;
  Map<String, int> get itemQuantities => _itemQuantities;

  final List<ItemModel> _selectedFavourites = [];

  List<ItemModel> get selectedFavourites => _selectedFavourites;

  void favouriteSelected(ItemModel item) {
    if (_selectedFavourites.contains(item)) {
      _selectedFavourites.remove(item);
      _itemQuantities.remove(item.productId);
    } else {
      _selectedFavourites.add(item);
      if (_itemQuantities[item.productId] == null) {
        _itemQuantities[item.productId!] = 1;
      }
    }
    notifyListeners();
  }

  void removeFromFavourites(ItemModel item) {
    _selectedFavourites.remove(item);
    _itemQuantities.remove(item.productId);
    notifyListeners();
  }

  void updateQuantity(ItemModel item, int newQuantity) {
    if (_selectedFavourites.contains(item) && newQuantity >= 1) {
      _itemQuantities[item.productId!] = newQuantity;
      notifyListeners();
    }
  }

  int get selectedFavouritesCount => _selectedFavourites.length;
  String getTotalPrice() {
    double total = 0;

    for (ItemModel item in _selectedFavourites) {
      String priceStr = item.unitPrice.replaceAll('', '').replaceAll('\$', '');
      double price = double.tryParse(priceStr) ?? 0;
      int quantity = _itemQuantities[item.productId] ?? 1;

      total += price * quantity;
    }

    return '\$: ${total.toStringAsFixed(2)}';
  }
}
