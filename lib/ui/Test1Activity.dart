import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/Test2Activity.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch second screen'),
          onPressed:(){
            print("这是FirstScreen的日志");
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SecondScreen(firstScreen: "我是来自FirstSceen的数据",))
            );
          },
        ),
      ),
    );
  }
}