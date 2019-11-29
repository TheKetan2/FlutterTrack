import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentPage = 0;
  var _pages = [
    Text("Page 1 - Announcements"),
    Text("Page 2 - Birthdays"),
    Text("Page 3 - Data")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Sample App"),
            ),
            // drawer: Drawer(
            //   elevation: 5,
            //   child: Column(
            //     children: <Widget>[
            //       Text("Item1"),
            //       Divider(),
            //       Text("Item2"),
            //       Divider(),
            //       Text("Text3"),
            //       Divider()
            //     ],
            //   ),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.announcement),
                  title: Text("Announcement"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cake),
                  title: Text("Birthday"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud),
                  title: Text("Data"),
                ),
              ],
              currentIndex: _currentPage,
              fixedColor: Colors.red,
              onTap: (int inIndex) {
                setState(() {
                  setState(() {
                    _currentPage = inIndex;
                  });
                });
              },
            ),
            body: Center(
              child: _pages.elementAt(_currentPage),
            )
            // body: Center(
            //   child: Card(
            //     elevation: 4,
            //     color: Colors.blue,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         Text("Child1"),
            //         Divider(),
            //         Text("Child2"),
            //         Divider(),
            //         Text("Child 3")
            //       ],
            //     ),
            //   ),
            // ),
            ));
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many time:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
