import 'package:flutter/material.dart';
  
class FutureGoals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title:new Text('Future Goals')),
        backgroundColor: Colors.blue[100],
        body:new ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('1 . Work as a data scientist'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2. Initiate a technology related startup'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3 . Invest in some promising startups'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('4 . Continue playing Golf'),
              ),
            ),

          ],
        )


    );
  }
  }

