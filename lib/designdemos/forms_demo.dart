import 'package:flutter/material.dart';

class FormsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Forms"),
          ),
          body: MyForm()),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();
//    controller.addListener(printNewText());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                maxLength: 10,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 10,
                obscureText: true,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter password";
                  } else if (value != "devdip") {
                    return "Wrong password";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email),
                ),
                onChanged: (newText) {
                  setState(() {
                    controller.text = newText;
                    print(newText);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Form Validated")));
                    FocusScope.of(context).requestFocus(focusNode);
                  }
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("New Value"),
                        content: Text(controller.text),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  printNewText() {
    print(controller.text);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    controller.dispose();
  }
}
