import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo 2"),
        ),
        body: GestureDemo2(),
      ),
    );
  }
}

class GestureDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Toast.show("OnTap Event", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
        onHorizontalDragEnd: (dragDownDetail) {
          Toast.show(
              "onHorizontalDragDown: ${dragDownDetail.velocity}", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        },
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.lightGreen,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
                style: BorderStyle.solid
              ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: Text(
                'Click Here',
                textAlign: TextAlign.center,
                style: TextStyle(backgroundColor: Colors.white),
              ),)

//              Center(
//                child: Text(
//                  'Click Here',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(backgroundColor: Colors.white),
//                ),
//              ),
            ],
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
