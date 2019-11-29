import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("What is your fav pet?"),
                FlatButton(
                  child: Text("Dog"),
                  onPressed: () {
                    print("Dog");
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Cat"),
                  onPressed: () {
                    print("Cat");
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Bird"),
                  onPressed: () {
                    print("Bird");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    _showSnackBar() {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        content: Text("I like pie!"),
        action: SnackBarAction(
          label: "Chow down",
          onPressed: () {
            print("Gettin six packs!");
          },
        ),
      ));
    }

    Future _showIt() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("What's your favorite food?"),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, "brocolli");
                  },
                  child: Text("Brocolli"),
                ),
                SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, "Egg");
                    },
                    child: Text("Egg"))
              ],
            );
          })) {
        case "brocolli":
          print("Brocolli");
          break;
        case "Egg":
          print("Egg");
          break;
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Show it"),
                onPressed: _showIt,
              ),
              RaisedButton(
                child: Text("Show it"),
                onPressed: _showSnackBar,
              ),
              RaisedButton(
                child: Text("Show it"),
                onPressed: _showBottomSheet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
