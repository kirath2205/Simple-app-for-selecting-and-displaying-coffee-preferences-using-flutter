import 'package:flutter/material.dart';
class FunStuff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title:new Text('Fun Stuff')),
        backgroundColor: Colors.blue[100],
        body:new ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('1 . Golf'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2. Reading'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3 . Hackerrank challenges'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('4 . Cricket'),
              ),
            ),

          ],
        )


    );
  }
}
