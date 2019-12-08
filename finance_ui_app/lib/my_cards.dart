import 'package:finance_ui_app/credit_card_container.dart';
import 'package:finance_ui_app/custom_container.dart';
import 'package:finance_ui_app/custom_icon_button.dart';
import 'package:finance_ui_app/icn_colors.dart';
import 'package:finance_ui_app/icn_img.dart';
import 'package:flutter/material.dart';

class MyCards extends StatefulWidget {
  final String title;

  const MyCards({Key key, this.title}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
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
                fontSize: 21.0),
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
              icon: Icon(
                Icons.add,
                color: Colors.black54,
              ),
              onPressed: () {},
            )
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
                      spreadRadius: 5.0,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Hero(
                  tag: "card",
                  child: Material(
                      child: InkWell(
                      child: CreditCardContainer(height: 300,),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              CustomContainer(
                child: Container(
                  
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomIconButton(
                        buttonImg: IconImgs.unlock,
                        buttonTitle: "UNLOCK PIN/CVV",
                        circleColor: IconColors.send,
                        onTap: () {},
                      ),
                      CustomIconButton(
                        buttonImg: IconImgs.freeze,
                        buttonTitle: "FREEZE CARD",
                        circleColor: Colors.lime[100],
                      ),
                      CustomIconButton(
                        buttonImg: IconImgs.secret,
                        buttonTitle: "SHOW SCRET CODE",
                        circleColor: Colors.pink[100],
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: CustomContainer(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.atm),
                            radius: 20,
                          ),
                          title: Text(
                            "ATM CARDLESS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          enabled: true,
                          onTap: () {},
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.location_on),
                            radius: 20,
                          ),
                          title: Text(
                            "ATM LOCATOR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          enabled: true,
                          onTap: () {},
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.security),
                            radius: 20,
                          ),
                          title: Text(
                            "SECURITY CARD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          enabled: true,
                          onTap: () {},
                        ),),
                        Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.assessment),
                            radius: 20,
                          ),
                          title: Text(
                            "LIMITS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          enabled: true,
                          onTap: () {},
                        ),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      
    );
  }
}
