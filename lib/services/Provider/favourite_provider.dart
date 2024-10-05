import 'package:e_commerce_fruits_app/Models/ItemsModel/fruits_models_list.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<ItemModel> _selectedFavourites = [];

  List<ItemModel> get selectedFavourites => _selectedFavourites;

  void favouriteSelected(ItemModel product) {
    if (_selectedFavourites.contains(product)) {
      _selectedFavourites.remove(product);
    } else {
      _selectedFavourites.add(product);
    }
    notifyListeners(); // This will rebuild widgets consuming the provider
  }
}
