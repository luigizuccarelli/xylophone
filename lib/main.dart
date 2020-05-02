import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('LMZ Xylophone'),
          backgroundColor: Colors.blue,
        ),
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  int number = 1;
  AudioPlayer ap = AudioPlayer();

  void keyboardSimulate(int number) {
    setState(() {
      ap.play('assets/note$number.wav', isLocal: true);
    });
  }

  Expanded buildKey({Color color, int number}) {
    return Expanded(
      child:FlatButton(
        color: color,
        onPressed: () {
          keyboardSimulate(number);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(color: Colors.red,number: 1),
        buildKey(color: Colors.orange,number: 2),
        buildKey(color: Colors.yellow,number: 3),
        buildKey(color: Colors.green,number: 4),
        buildKey(color: Colors.teal,number: 5),
        buildKey(color: Colors.blue,number: 6),
        buildKey(color: Colors.purple,number: 7),
      ],
    );
  }
}
