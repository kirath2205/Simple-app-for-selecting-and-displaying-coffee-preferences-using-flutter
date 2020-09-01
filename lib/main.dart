import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spike_exercise/Models/user.dart';
import 'package:spike_exercise/screens/wrapper.dart';
import 'package:spike_exercise/services/auth.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return StreamProvider<User>.value
      (
      value:AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
