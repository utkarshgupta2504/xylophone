import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int sound) {
    final player = AudioCache();
    player.play('note$sound.wav');
  }

  final List colorArr = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.deepPurple
  ];

  final List<int> keys = [1, 2, 3, 4, 5, 6, 7];

  Widget buildKey(key) {
    return Expanded(
      child: FlatButton(
        color: colorArr[key - 1],
        onPressed: () {
          playSound(key);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keys
                .map<Widget>(
                  (e) => Expanded(
                    child: FlatButton(
                      color: colorArr[e - 1],
                      onPressed: () {
                        playSound(e);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
