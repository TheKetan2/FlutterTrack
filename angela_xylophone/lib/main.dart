import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  
                  color: Colors.red,
                  onPressed: (){
                    padding: EdgeInsets.all(30.0);
                    final player = AudioCache();
                    player.play('note1.wav');
                  },
                ),
                FlatButton(
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note2.wav');
                  },
                  color: Colors.orange,
                ),
                FlatButton(
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note3.wav');
                  },
                  color: Colors.yellow,
                ),
                FlatButton(
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note4.wav');
                  },
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note5.wav');
                  },
                  color: Colors.teal,
                ),
                FlatButton(
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note6.wav');
                  },
                  color: Colors.blue,
                ),
                FlatButton(
                  
                  onPressed: (){
                    
                    final player = AudioCache();
                    player.play('note7.wav');
                  },
                  color: Colors.purple,
                ),
              ],
            ),
            
          ),
        ),
    );
  }

}