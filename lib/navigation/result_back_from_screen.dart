import 'package:flutter/material.dart';

class GetResultBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("First Screen"),
            ),
            body: FirstScreen(),
          );
        },
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  final controller = TextEditingController();
  ObjectKey formKey = ObjectKey("FormKey");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter your question",
                  icon: Icon(Icons.question_answer),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter question";
                  }
                  return null;
                },
              ),
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                return navigateAndGetResultBack(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void navigateAndGetResultBack(BuildContext context) async {
    final result = await Navigator.pushNamed(context, "/second",
        arguments: controller.text);

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String argQuestion = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                argQuestion,
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Yup!"),
                  onPressed: () {
                    Navigator.pop(context, "Yup!");
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                RaisedButton(
                  child: Text("Nop!"),
                  onPressed: () {
                    Navigator.pop(context, "Nop!");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
