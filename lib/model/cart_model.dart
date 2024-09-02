import 'package:flutter/material.dart';
import 'package:shopping/model/product_model.dart';

class CartModel extends ChangeNotifier {
  final String nam;
  final int pric;
  //final bool order;
  final List<ProductModel> _items = [];

  CartModel({required this.nam, required this.pric});

  List<ProductModel> get items => _items;

  void add(ProductModel product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(ProductModel product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
