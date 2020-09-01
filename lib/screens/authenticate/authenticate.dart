import 'package:flutter/material.dart';
import 'package:spike_exercise/screens/authenticate/register.dart';
import 'package:spike_exercise/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool display_signin=true;


  void toggle_view()
  {
    setState(()=>display_signin=!display_signin);
  }

  @override
  Widget build(BuildContext context) {
    if(display_signin)
      return SignIn(toggle_view : toggle_view);
    else
      return Register(toggle_view : toggle_view);


  }
}
