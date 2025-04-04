import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // Method to play sound
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.setSource(AssetSource("note$soundNumber.wav"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Xylophone App')),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(1);
                  },
                  color: Colors.red,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(2);
                  },
                  color: Colors.orange,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(3);
                  },
                  color: Colors.yellow,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(4);
                  },
                  color: Colors.green,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(5);
                  },
                  color: Colors.teal,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(6);
                  },
                  color: Colors.blue,
                  enableFeedback: false,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    playSound(7);
                  },
                  color: Color.fromARGB(255, 0, 18, 122),
                  enableFeedback: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
