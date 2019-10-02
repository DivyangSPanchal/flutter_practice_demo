import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(
    "https://jsonplaceholder.typicode.com/posts/1",
    headers: {
      HttpHeaders.authorizationHeader: "Authorization-Header",
    },
  );

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception("Unable to fetch post");
  }
}

class FetchNetworkData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowFetchedData();
  }
}

class ShowFetchedData extends State<FetchNetworkData> {
  Future<Post> post;

  @override
  void initState() {
    post = fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Network Data"),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (content, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
