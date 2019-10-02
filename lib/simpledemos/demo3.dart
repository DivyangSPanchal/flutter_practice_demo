import 'package:flutter/material.dart';
import 'dart:math';

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo3"),
        ),
        body: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<Counter> {
  int count = 0;
  int index = 0;
  Random random = new Random();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.black,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
    Colors.yellow
  ];

  void doIncrement() {
    setState(() {
      count++;
    });
  }

  void changeColor() {
    Future.delayed(const Duration(microseconds: 1000), () {
      setState(() {
        index = random.nextInt(9);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            child: Text("Increment: $count"),
            onPressed: changeColor,
            color: colorList[index],
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
