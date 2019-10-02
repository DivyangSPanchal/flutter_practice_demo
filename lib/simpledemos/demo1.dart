import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDemo1(),
    );
  }
}

class MyDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo 1"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Demo Snackbar"),
          )),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Text("Demo 1"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Toast.show("Clicked", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER),
      ),
    );
  }
}
