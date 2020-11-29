import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';


void main() => runApp(MagicBallPage());



class MagicBallPage extends StatefulWidget {
  @override
  _MagicBallPageState createState() => _MagicBallPageState();
}


class _MagicBallPageState extends State<MagicBallPage> {
  int ballNum = 1;
  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        changeBallFace();
      });
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }
  void changeBallFace(){
    setState(()=>{
    ballNum = Random().nextInt(5)+1
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Center(child: Text('Magic 8 Ball ')),
        ),
        body: Center(
          child: GestureDetector(
            onTap:(){
              changeBallFace();
              },
           child: Image.asset('images/ball$ballNum.png'),
          ),
        ),
      ),
    );
  }
}


