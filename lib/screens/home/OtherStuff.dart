import 'package:flutter/material.dart';

class OtherStuff extends StatefulWidget {
  @override
  _OtherStuffState createState() => _OtherStuffState();
}

class _OtherStuffState extends State<OtherStuff> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title:new Text('Other Stuff')),
        backgroundColor: Colors.blue[100],
        body:new ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('1 . Pubg'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2. Call of Duty'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3 . Monopoly'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('4 . Snooker'),
              ),
            ),

          ],
        )


    );
  }
}
