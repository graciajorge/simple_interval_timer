import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white)
        ),
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.lightGreen[800],
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center (
          child: TimerCountDown(),
        ),
      ),

    );
  }
}

class TimerCountDown extends StatefulWidget {
  TimerCountDownState createState() => TimerCountDownState();
}

class TimerCountDownState extends State<TimerCountDown> with TickerProviderStateMixin {
  var timer = 20;
  AnimationController controller;
  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 20),vsync: this);
  }
  String get timerString {
    Duration dur = controller.duration * controller.value;
    return "${dur.inMinutes}:${(dur.inSeconds % 60).toString().padLeft(2,'0')}";
  }
  Widget build(BuildContext context) {
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return new Text(
          timerString
        );
      },
    );
  }
}


