import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  ResusableCard({@required this.clr, this.cardChild});
  final Color clr;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
