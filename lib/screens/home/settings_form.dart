import 'package:flutter/material.dart';
import 'package:spike_exercise/Models/user.dart';
import 'package:spike_exercise/services/database.dart';
import 'package:spike_exercise/shared/Loading.dart';
import 'package:spike_exercise/shared/constants.dart';
import 'package:provider/provider.dart';
class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars =['0','1','2','3'];
  String _currentName;
  String _currentSugar;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your brew settings ',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: userData.name,
                      decoration: settingsDecoration,
                      validator: (val) =>
                      val.isEmpty
                          ? 'Please enter a name'
                          : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(height: 20,),
                    DropdownButtonFormField(
                      value: _currentSugar ?? userData.sugar,
                      decoration: settingsDecoration,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar grams sugar'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentSugar = val),
                    ),

                    Slider(
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      activeColor: Colors.teal[_currentStrength ?? 100],
                      inactiveColor: Colors.lightGreenAccent[_currentStrength ??
                          100],
                      min: 100,
                      max: 900,
                      divisions: 5,
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round()),
                    ),


                    RaisedButton(
                      color: Colors.green[400],
                      child: Text(
                        'Update', style: TextStyle(color: Colors.white),
                      ),

                      onPressed: () async
                      {
                        if(_formKey.currentState.validate())
                          {
                            await DatabaseService(uid:user.uid).updateUserData(
                              _currentSugar?? userData.sugar,
                              _currentName?? userData.name,
                               _currentStrength?? userData.strength
                            );
                            Navigator.pop(context);
                          }
                        print(_currentName);
                        print(_currentSugar);
                        print(_currentStrength);
                      },
                    )


                  ],
                )
            );
          }
          else return Loading() ;




      }
    );
  }
}
