import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class LoginData {
  String username = "";
  String password = "";
}

class _MyAppState extends State<MyApp> {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Input Form"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50.0),
              child: Form(
                key: this._formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (String inValue) {
                        if (inValue.length == 0) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (String inValue) {
                        this._loginData.username = inValue;
                        setState(() {
                          this._loginData.username = inValue;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "your@email.com",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (String inValue) {
                        if (inValue.length < 10) {
                          return "Password must be >=10 in length";
                        }
                        return null;
                      },
                      onSaved: (String inValue) {
                        this._loginData.password = inValue;
                        setState(() {
                          this._loginData.password = inValue;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                      ),
                    ),
                    RaisedButton(
                      child: Text("Log in!"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print("Username: ${_loginData.username}");
                          print("Password: ${_loginData.password}");
                        }
                      },
                    ),
                    _loginData.username.length >0?Text("Username: ${_loginData.username}"):Text("Username: "),
                    _loginData.password.length >0?Text("Password: ${_loginData.password}"):Text("Password: ")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
