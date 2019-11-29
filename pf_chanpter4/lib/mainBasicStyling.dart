import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      appBar: AppBar(
         title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Theme(
              data: ThemeData(accentColor: Colors.red),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Text("This is new themed text", style: Theme.of(context).textTheme.title,),
              ),
              
            ),
            Opacity(
              opacity: .60,
              child: Text("Faded"),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.blue, Colors.green],
                  tileMode: TileMode.repeated
                )
              ),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text("Hello", style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(height: 10,),
            Center(
              child: Container(
                color: Colors.green,
                child: Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.skewY(0.100)..rotateZ(2/12.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.red,
                    child: Text("Eat at Joe's!"),
                  ),
                )
              ),
            )
          ],
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
