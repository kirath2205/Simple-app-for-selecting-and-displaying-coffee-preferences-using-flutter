import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spike_exercise/Models/user.dart';
import 'package:spike_exercise/screens/authenticate/authenticate.dart';
import 'package:spike_exercise/screens/home/home.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    print(user);
    // return either home or authenticate
    if(user==null)
      return Authenticate();
    else
      return Home();
  }
}
