import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spike_exercise/screens/home/InterestingStuff.dart';
import 'package:spike_exercise/screens/home/Myclasses.dart';
import 'package:spike_exercise/screens/home/OtherStuff.dart';
import 'package:spike_exercise/screens/home/settings_form.dart';
import 'package:spike_exercise/services/auth.dart';
import 'package:spike_exercise/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:spike_exercise/Models/brew.dart';
import 'package:spike_exercise/screens/home/brew_list.dart';
import 'package:spike_exercise/Models/user.dart';
import 'AboutMe.dart';
import 'Myclasses.dart';
import 'FutureGoals.dart';
import 'FunStuff.dart';
import 'InterestingStuff.dart';
class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  final _formKey = GlobalKey<FormState>();
  final Brew brew;
  Home({this.brew});
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    void _showSettingsPanel()
    {
        showModalBottomSheet(context: context, builder: (context){
            return Container(
              padding:EdgeInsets.symmetric(vertical: 20,horizontal: 60),
              child: SettingsForm(),

            );
        });

    }
    return StreamProvider<List<Brew>>.value(
      value:DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.teal[40],
        appBar: AppBar(

          backgroundColor: Colors.teal[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              icon:Icon(Icons.person),
              label: Text('log-out'),
              onPressed: ()async
              {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon:Icon(Icons.settings),
              label:Text('Settings'),
              onPressed: ( )=>_showSettingsPanel(),
            )
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(accountName: new Text('Kirath Singh'), accountEmail: new Text('singhkirath@gmail.com'),
              decoration: new BoxDecoration(image: new DecorationImage(fit :BoxFit.fill,image: AssetImage('assets/side.jpg') )),
              ),
              new ListTile(
                title: new Text('About Me'),
                trailing: new Icon(Icons.insert_emoticon),

                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AboutMe())),



              ),
              new ListTile(
                title: new Text('My classes'),
                trailing: new Icon(Icons.assignment),
                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Myclasses())),
              ),
              new ListTile(
                title: new Text('Future goals'),
                trailing: new Icon(Icons.arrow_upward),
                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FutureGoals())),
              ),
              new ListTile(
                title: new Text('Fun stuff'),
                trailing: new Icon(Icons.color_lens),
                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FunStuff())),
              ),
              new ListTile(
                title: new Text('Other stuff'),
                trailing: new Icon(Icons.content_paste),
                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherStuff())),
              ),
              new ListTile(
                title: new Text('Interesting stuff'),
                trailing: new Icon(Icons.keyboard),
                onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new InterestingStuff())),

              ),
              new Divider(),
              new ListTile(
                title: new Text('Close'),
                trailing: new Icon(Icons.cancel),
                onTap: ()=> Navigator.of(context).pop(),
              )
            ],
          )
        ),
        body:Container(decoration:BoxDecoration(
          image: DecorationImage(image :AssetImage('assets/background.jpg'),fit:BoxFit.cover)
        ),child: BrewList()),
      ),
    );
  }
}
