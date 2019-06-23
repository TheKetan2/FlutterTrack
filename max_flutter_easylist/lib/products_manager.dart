import 'package:flutter/material.dart';
import 'products.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Tester'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            child: Text('Add Product'),
            onPressed: () {
              setState(() {
                _products.add('Chef');
              });
            },
          ),
        ),
        Products(products: _products),
      ],
    );
  }
}
