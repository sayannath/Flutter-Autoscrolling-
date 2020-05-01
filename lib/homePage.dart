import 'package:demo_scroll/floatPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          ),
          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return FloatPage();
            }));
          },
            child: Text('Next'),
          ),
        ],
      )),
    );
  }
}
