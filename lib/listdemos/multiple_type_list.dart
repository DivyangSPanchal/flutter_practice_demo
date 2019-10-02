import 'package:flutter/material.dart';

class MultipleTypeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Multiple Type List"),
        ),
        body: MyMultipleTypeList(),
      ),
    );
  }
}

List<ListItem> items;

class MyMultipleTypeList extends StatelessWidget {
  MyMultipleTypeList() {
    items = List<ListItem>.generate(200, (i) {
      return i % 6 == 0
          ? HeaderItem("Headinng $i")
          : MessageItem("Sender $i", "Message body $i");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeaderItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
      },
    );
  }
}

abstract class ListItem {}

class HeaderItem implements ListItem {
  final String heading;

  HeaderItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
