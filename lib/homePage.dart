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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Enter please',
                hintStyle: TextStyle(color: Colors.red),
              ),
              controller: textController,
            ),
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

class FloatPage extends StatefulWidget {
  final User user;
  FloatPage({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _FloatPageState createState() => _FloatPageState(user);
}

class _FloatPageState extends State<FloatPage> {
  User user;
  _FloatPageState(this.user);

  double top = 0;
  double left = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drag')),
      body: Container(
        child: Draggable(
          child: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(param: '${user.s}'),
          ),
          feedback: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(param: '${user.s}'),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: Container(
              child: DragItem(param: '${user.s}'),
            ),
          ),
          onDragCompleted: () {},
          onDragEnd: (drag) {
            setState(() {
              top = top + drag.offset.dy < 0 ? 0 : top + drag.offset.dy;
              left = left + drag.offset.dx < 0 ? 0 : left + drag.offset.dx;
            });
          },
        ),
      ),
    );
  }
}

class DragItem extends StatelessWidget {
  DragItem({Key key, this.param}) : super(key: key);

  final String param;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(left: 40, right: 40),
        children: [
          _buildComplexMarquee(),
        ].map(_wrapWithStuff).toList(),
      ),
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      text: '$param',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
      padding: EdgeInsets.all(1.0),
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.all(10.0),
        color: Colors.blue,
        child: child,
      ),
    );
  }
}
