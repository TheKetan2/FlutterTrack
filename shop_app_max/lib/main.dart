import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_max/provider/cart.dart';
import 'package:shop_app_max/screens/cart_screen.dart';
import 'package:shop_app_max/screens/products_details_screen.dart';
import 'package:shop_app_max/screens/products_overview_screen.dart';
import 'provider/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
