import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final firstScreen;
  SecondScreen({Key key,this.firstScreen}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text(firstScreen),
          onPressed: (){
            Navigator.pop(context,"这是来自SecondScreen的数据");

          },
        ),
      ),
    );
  }
}

