import 'package:flutter/material.dart';

class SwipeToDismiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Swipe to dismiss"),
          ),
          body: MySwipeDeleteList()),
    );
  }
}

class MySwipeDeleteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwipeDeleteListState();
  }
}

class SwipeDeleteListState extends State<MySwipeDeleteList> {
  final items = List<String>.generate(50, (index) {
    return "Item ${index + 1}";
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item Removed")));
          },
          child: ListTile(
            title: Text("$item"),
          ),
        );
      },
    );
  }
}
