import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/products_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}
