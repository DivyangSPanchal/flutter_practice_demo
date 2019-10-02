import 'package:flutter/material.dart';
import 'dart:math';

class Demo7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimatedContainerWidget());
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedContainerState();
  }
}

class AnimatedContainerState extends State<AnimatedContainerWidget> {
  double width = 50;
  double height = 50;
  Color color = Colors.green;
  BorderRadiusGeometry borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration:
              BoxDecoration(color: color, borderRadius: borderRadiusGeometry),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            final random = Random();

            width = random.nextInt(300).toDouble();
            height = random.nextInt(300).toDouble();

            color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);

            borderRadiusGeometry =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
