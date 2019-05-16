import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('img/namo.jpg'),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[100]
                ),
              ),
              Text(
                'Ketan D. Ramteke',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'FULLSTACK DEVELOPER',
                style: TextStyle(
                  color: Colors.teal[100],
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text('2222222222',
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontFamily: 'SansPro',
                            fontSize: 20.0,
                          )),
                  ),
                ),
              ),
              
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text('ketan@ramteke.com',
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontFamily: 'SansPro',
                            fontSize: 20.0,
                          )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


