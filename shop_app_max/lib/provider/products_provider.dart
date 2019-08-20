import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> get item {
    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }
}
