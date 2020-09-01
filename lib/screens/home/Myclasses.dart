import 'package:flutter/material.dart';
class Myclasses extends StatelessWidget {
  @override
  final String text;
  Myclasses({this.text});
  Widget build(BuildContext context) {

      return new Scaffold(
          appBar: new AppBar(title:new Text('My Classes')),
          backgroundColor: Colors.blue[100],
          body:new ListView(
            children: const <Widget>[




              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('CS 540'),
                  subtitle: Text(
                      'Introduction to Artificial Intelligence'
                  ),

                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('CS 559'),
                  subtitle: Text(
                      'Introduction to Computer Graphics'
                  ),

                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('CS 640'),
                  subtitle: Text(
                      'Introduction to Computer Networks'
                  ),

                  isThreeLine: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('CS 506'),
                  subtitle: Text(
                      'Software Engineering'
                  ),

                  isThreeLine: true,
                ),
              ),

              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('ECE 532'),
                  subtitle: Text(
                      'Matrix methods in Machine Learning'
                  ),

                  isThreeLine: true,
                ),
              ),


              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('ISYE 603'),
                  subtitle: Text(
                      'Data Science for People'
                  ),

                  isThreeLine: true,
                ),
              ),
            ],
          )


      );
    }
}
