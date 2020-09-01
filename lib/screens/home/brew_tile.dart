import 'package:flutter/material.dart';
import 'package:spike_exercise/Models/brew.dart';
class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.only(top:8.0),
    child:Card(
      margin:EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: ListTile(
        leading:CircleAvatar(radius:25,
          backgroundColor: Colors.teal[brew.strength],
        ),
        title:Text(brew.name),
        subtitle: Text('Take ${brew.sugar} grams sugar '),
      )
    ));
  }
}
