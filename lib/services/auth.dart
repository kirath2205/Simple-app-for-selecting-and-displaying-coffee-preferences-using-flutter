import 'package:firebase_auth/firebase_auth.dart';
import 'package:spike_exercise/Models/user.dart';
import 'package:spike_exercise/services/database.dart';

class AuthService
{
  // sign in anonymous
  //sign in with email and password
  //register with email and password
  //signout
  User _userFromFireBaseUser(FirebaseUser user)
  {
    return user!=null ? User(uid: user.uid): null;
  }

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Stream<User> get user
  {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }
  Future signInAnon() async
  {
    try
    {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }

  Future register_with_email_password(String email,String password) async
  {
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      await DatabaseService(uid:user.uid).updateUserData('0', 'new member', 100);
      return _userFromFireBaseUser(user);
    }
    catch(e)
    {
        print(e.toString());
        return null;
    }
  }



  Future signin_with_email_password(String email,String password) async
  {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return _userFromFireBaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async
  {
    try
    {
        return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }
}