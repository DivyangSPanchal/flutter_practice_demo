import 'package:flutter/material.dart';

class Demo8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: fadeWidget());
  }
}

class fadeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return fadeWidgetState();
  }
}

class fadeWidgetState extends State<fadeWidget> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade Animation"),
      ),
      body: Center(
        child : AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flip),
        onPressed: () {
          setState(() {
            visible = !visible;
          });
        },
      ),
    );
  }
}
