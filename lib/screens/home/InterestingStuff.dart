import 'package:flutter/material.dart';
class InterestingStuff extends StatefulWidget {
  @override
  _InterestingStuffState createState() => _InterestingStuffState();
}

class _InterestingStuffState extends State<InterestingStuff> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title:new Text('Interesting Stuff')),
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
                title: Text('3 . Golf'),
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
