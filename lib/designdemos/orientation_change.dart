import 'package:flutter/material.dart';

class OrientationChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Orientation Change"),
        ),
        body: MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(
            100,
            (index) {
              return Center(
                child: Text(
                  "Item $index",
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
