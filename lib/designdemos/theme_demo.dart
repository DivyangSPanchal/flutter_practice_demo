import 'package:flutter/material.dart';

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Title",
      home: MyTheme(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        primaryColorDark: Colors.deepOrange,
        accentColor: Colors.pink,
        brightness: Brightness.dark,
        fontFamily: "Roboto",
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: "Hind")),
      ),
    );
  }
}

class MyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            "Text With Background Color",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          child: Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
