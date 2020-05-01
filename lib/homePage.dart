import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

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
      body: ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: [
          _buildComplexMarquee(),
        ].map(_wrapWithStuff).toList(),
      ),
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      text: '${user.s}',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 10.0,
      startPadding: 10.0,
      accelerationCurve: Curves.linear,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: 0,
        color: Colors.yellow,
        child: child,
      ),
    );
  }
}
