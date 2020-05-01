import 'package:flutter/material.dart';

class User {
  final String s;
  User(this.s);
}

class HomePage extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Marquee")),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Enter please',
              hintStyle: TextStyle(color: Colors.red),
            ),
            controller: textController,
          ),
          RaisedButton(
            onPressed: () {
              _navigateFloat(context);
            },
            child: Text('Next'),
          ),
        ],
      )),
    );
  }

  _navigateFloat(BuildContext context) async {
    User user = new User(textController.text);
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FloatPage(
                  user: user,
                )));
    print(result);
  }
}

class FloatPage extends StatelessWidget {
  final User user;
  FloatPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marquee"),
      ),
      body: Center(
        child: Text("${user.s}"),
      ),
    );
  }
}
