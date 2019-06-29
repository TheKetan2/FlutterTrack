import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products({this.products}) {
    print("Product class executed");
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/cam.png'),
                    Text(products[0]),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
