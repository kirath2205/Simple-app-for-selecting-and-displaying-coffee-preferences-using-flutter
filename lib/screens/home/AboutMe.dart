import 'package:flutter/material.dart';
class AboutMe extends StatelessWidget {
  @override
  final String text;
  AboutMe({this.text});
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: new AppBar(title:new Text('About Me')),
        body:new Center(child:new Text('I am Kirath,a sophomore, studying computer science at Nanyang Technological University, currently on an exchange semester '))
    );
  }
}
