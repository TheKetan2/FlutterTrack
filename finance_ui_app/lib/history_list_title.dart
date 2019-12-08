import 'package:flutter/material.dart';

class HistoryListTile extends StatelessWidget {
  final Color iconColor;
  final String transactionName,
      transactionType,
      transactionAmount,
      transactionIcon;
  final GestureTapCallback onTap;
  const HistoryListTile(
      {Key key,
      this.iconColor,
      this.transactionName,
      this.transactionType,
      this.transactionAmount,
      this.transactionIcon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(transactionName),
        subtitle: Text(transactionType),
        trailing: Text(transactionAmount),
        leading: CircleAvatar(
          radius: 25,
      child: Image.asset(
        transactionIcon,
        height: 25,
        width: 25
        ),
        backgroundColor: iconColor,
        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}
