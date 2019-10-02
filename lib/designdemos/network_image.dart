import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Network Image"),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Center(
                      child: CircularProgressIndicator(
                    value: 50,
                  )),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          "https://cdn.pixabay.com/photo/2019/07/07/14/03/fiat-4322521__480.jpg"),
                ],
              ),
              Center(
                child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: "https://i.imgur.com/KOXOBiN.gif",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
