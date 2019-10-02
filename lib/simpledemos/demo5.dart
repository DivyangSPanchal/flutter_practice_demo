import 'package:flutter/material.dart';

class Demo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo5"),
        ),
        body: Bird(
          child: Text("BIRD"),
        ),
      ),
    );
  }
}

class Bird extends StatefulWidget {
  const Bird({
    Key key,
    this.color = const Color(0xFFFFE306),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  _BirdState createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: widget.color,
        transform: Matrix4.diagonal3Values(_size, _size, _size),
        child: widget.child,
      ),
      onTap: grow,
    );
  }
}
