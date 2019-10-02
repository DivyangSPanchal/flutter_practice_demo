import 'package:flutter/material.dart';

class GridListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Forms"),
        ),
        body: GridView.count(
          scrollDirection: Axis.vertical,
            crossAxisCount: 3,
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
            )),
      ),
    );
  }
}
