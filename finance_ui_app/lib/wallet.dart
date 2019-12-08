import 'package:finance_ui_app/credit_card_container.dart';
import 'package:finance_ui_app/custom_container.dart';
import 'package:finance_ui_app/custom_icon_button.dart';
import 'package:finance_ui_app/custom_rounded_button.dart';
import 'package:finance_ui_app/history_list_title.dart';
import 'package:finance_ui_app/icn_colors.dart';
import 'package:finance_ui_app/icn_img.dart';
import 'package:finance_ui_app/my_cards.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  final String title;

  const Wallet({Key key, this.title}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black54,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Container(
              height: 21,
              width: 21,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[300],
                      spreadRadius: 5.0)
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Hero(
                tag: "card",
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: CreditCardContainer(),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MyCards(
                          title: "My Cards",
                        );
                      }));
                    },
                  ),
                ),
              ),
            ),
            CustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomIconButton(
                    circleColor: IconColors.send,
                    buttonImg: IconImgs.send,
                    buttonTitle: "SEND",
                    onTap: () {},
                  ),
                  CustomIconButton(
                    circleColor: IconColors.passbook,
                    buttonImg: IconImgs.passbook,
                    buttonTitle: "PASSBOOK",
                    onTap: () {},
                  ),
                  CustomIconButton(
                    circleColor: IconColors.more,
                    buttonImg: IconImgs.more,
                    buttonTitle: "MORE",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            CustomContainer(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Transactions",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      CustomRoundedButton(
                        buttonText: "More",
                        color: Colors.blue,
                        onTap: () {},
                      )
                    ],
                  ),
                  
                  SizedBox(
                    height: 15.0,
                  ),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "+\$210.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Zym",
                        transactionType: "Transfer",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "+\$310.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Bub",
                        transactionType: "Transfer",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.send,
                        onTap: () {},
                        transactionAmount: "+\$10.00",
                        transactionIcon: IconImgs.send,
                        transactionName: "Zym",
                        transactionType: "Transfer",
                      ),
                    ],
                  )
                ],
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}
