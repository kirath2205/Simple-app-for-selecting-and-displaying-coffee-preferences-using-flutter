import 'package:flutter/material.dart';
import 'package:spike_exercise/services/auth.dart';
import 'package:spike_exercise/shared/constants.dart';
import 'package:spike_exercise/shared/Loading.dart';
class Register extends StatefulWidget {
  final Function toggle_view;
  Register({this.toggle_view});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey =GlobalKey<FormState>();
  bool loading=false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold
      (
      backgroundColor: Colors.teal[200],
      appBar: AppBar
        (
          backgroundColor : Colors.teal[500],
          elevation: 10.0,

          title:Text('Sign up to Spike exercise'),
        actions: <Widget>[FlatButton.icon(icon:Icon(Icons.person),label:Text('Sign-in'),onPressed: (){widget.toggle_view();},)],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child:Form(
          key:_formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                  decoration:  textInputDecoration,
                  validator: (val)=> val.isEmpty ? 'Enter an email':null,
                  onChanged: (val){
                setState(()=> email=val);
              }
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration:  password_decoration,
                  validator: (val)=> val.length<6 ? 'Enter a password 6 plus characters long':null,
                onChanged: (val){
                  setState(()=> password=val);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.white,
                child:Text('Register',style:TextStyle(color: Colors.indigo)),
                onPressed: ()async{
                    if(_formKey.currentState.validate())
                      {
                        setState(() {
                          loading=true;
                        });
                        dynamic result= await _auth.register_with_email_password(email,password);
                        if(result==null)
                            setState((){ error='please supply a valid email';
                            loading=false;});
                      }




                },
              ),
              SizedBox(height: 12),
              Text(
                error,
                style:TextStyle(color:Colors.red,fontSize: 14),
              )
            ],
          ),
        ),
      )
      ,
    );
  }
}
