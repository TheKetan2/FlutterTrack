import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/cam.png'),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget productList = Center(
      child: Text('Nothing to show'),
    );
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    print('[Products Widget] build()');
    return productList;
  }
}
