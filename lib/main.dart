import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/simpledemos/demo1.dart';
import 'package:flutter_practice_demo/simpledemos/demo2.dart';
import 'package:flutter_practice_demo/simpledemos/demo3.dart';
import 'package:flutter_practice_demo/simpledemos/shopping_list.dart';
import 'package:flutter_practice_demo/simpledemos/demo5.dart';
import 'package:flutter_practice_demo/simpledemos/animation.dart';
import 'package:flutter_practice_demo/simpledemos/animated_container.dart';
import 'package:flutter_practice_demo/simpledemos/fade_widget.dart';
import 'package:flutter_practice_demo/designdemos/drawer_demo.dart';
import 'package:flutter_practice_demo/designdemos/orientation_change.dart';
import 'package:flutter_practice_demo/designdemos/theme_demo.dart';
import 'package:flutter_practice_demo/designdemos/tabbar_demo.dart';
import 'package:flutter_practice_demo/designdemos/swipe_to_delete.dart';
import 'package:flutter_practice_demo/designdemos/network_image.dart';
import 'package:flutter_practice_demo/designdemos/forms_demo.dart';
import 'package:flutter_practice_demo/listdemos/grid_list_demo.dart';
import 'package:flutter_practice_demo/listdemos/multiple_type_list.dart';
import 'package:flutter_practice_demo/listdemos/sliverlistdemo.dart';
import 'package:flutter_practice_demo/navigation/across_screen_animation.dart';
import 'package:flutter_practice_demo/navigation/result_back_from_screen.dart';
import 'package:flutter_practice_demo/networkingdemos/fetch_network_data.dart';
import 'package:flutter_practice_demo/networkingdemos/background_request.dart';
import 'package:flutter_practice_demo/networkingdemos/websocketdemo.dart';

//-----Simple Demos------
//void main() => runApp(MyApp());
//void main() => runApp(Demo1());
//void main() => runApp(Demo2());
//void main() => runApp(Demo3());
//void main() => runApp(Demo4());
//void main() => runApp(Demo5());
//void main() => runApp(Demo6());
//void main() => runApp(Demo7());
//void main() => runApp(Demo8());

//-----Design Demos------
//void main() => runApp(DrawerDemo());
//void main() => runApp(OrientationChange());
//void main() => runApp(ThemeDemo());
//void main() => runApp(TabBarDemo());
//void main() => runApp(SwipeToDismiss());
//void main() => runApp(NetworkImageDemo());
//void main() => runApp(FormsDemo());

//-----Lists Demos------
//void main() => runApp(GridListDemo());
//void main() => runApp(MultipleTypeList());
//void main() => runApp(SliverListDemo());

//-----Navigation Demos------
//void main() => runApp(AcrossScreenAnimation());
//void main() => runApp(GetResultBack());

//-----Network Demos------
//void main() => runApp(FetchNetworkData());
//void main() => runApp(DisplayPhotos());
void main() => runApp(WebSocket());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DemoApp",
      home: SafeArea(child: MyScaffold()),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigate Menu",
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              Navigator.of(context).push(createRoute());
            },
          ),
        ],
      ),
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Demo2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeOut;
        var curveTween = CurveTween(curve: curve);
        var tween = Tween(begin: begin, end: end).chain(curveTween);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              "Example Text",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello World"),
            ),
          )
        ],
      ),
    );
  }
}
