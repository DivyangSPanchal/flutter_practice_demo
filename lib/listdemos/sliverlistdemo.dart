import 'package:flutter/material.dart';

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: myCustomScrollView(),
      ),
    );
  }
}

class myCustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Floating Appbar"),
          floating: true,
          expandedHeight: 200,
//          flexibleSpace: SizedBox.expand(child: FlutterLogo()),
          flexibleSpace: Image.asset("assets/images/flutter_bird.png"),
          pinned: true,
          snap: false,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                    title: Text("Item $index"),
                  ),
              childCount: 100),
        )
      ],
    );
  }
}
