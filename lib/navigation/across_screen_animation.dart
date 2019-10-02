import 'package:flutter/material.dart';

class AcrossScreenAnimation extends StatelessWidget {
  static const String secondRoute = '/second';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Screen1(),
        secondRoute: (context) => Screen2(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transition Animation"),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              NoAnimPageroute(
                builder: (_) {
                  return Screen2();
                },
              ),
            );
          },
          onDoubleTap: () {
            Navigator.pushNamed(context, AcrossScreenAnimation.secondRoute,
                arguments: MyArguments("Data From First Screen"));
          },
          child: Hero(
            tag: "imageTag",
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/flutter_bird.png"),
            ),
          ),
        ));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args != null ? args.data : "No Arguments"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: "imageTag",
          child: Center(
            child: Image.asset("assets/images/flutter_bird.png"),
          ),
        ),
      ),
    );
  }
}

class MyArguments {
  final String data;

  MyArguments(this.data);
}

class NoAnimPageroute<T> extends MaterialPageRoute<T> {
  NoAnimPageroute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
