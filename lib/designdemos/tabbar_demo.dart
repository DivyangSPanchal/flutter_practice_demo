import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.directions_car),
                  text: "Car",
                ),
                Tab(
                    icon: Icon(
                      Icons.directions_transit,
                    ),
                    text: "Train"),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: "Bike",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(
                Icons.directions_car,
                size: 256.0,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    print('Clicked');
                  },
                  child: MyButton(),
                ),
              ),
              Icon(
                Icons.directions_bike,
                size: 256.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}