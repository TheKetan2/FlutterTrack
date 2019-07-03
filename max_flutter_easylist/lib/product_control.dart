import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function onClick;

  const ProductControl({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text('Add Product'),
            onPressed: () {
              onClick('New Something');
            },
          );
  }
}