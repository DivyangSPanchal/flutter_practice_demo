import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> scaffoldState;

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text("Drawer"),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Text(
            "Dummy font text here",
            style: TextStyle(
              fontFamily: "Roboto",
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
          ),
          ListTile(
            title: Text("Item 1"),
            onTap: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Item1 Clicked"),
                  action: SnackBarAction(
                      label: "ok",
                      onPressed: () {
                        scaffoldState.currentState.hideCurrentSnackBar();
                      }),
                ),
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item 2"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
