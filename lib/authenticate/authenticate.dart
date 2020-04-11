import 'package:auth_test/authenticate/register.dart';
import 'package:auth_test/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
   bool  showSignIn=true;

    void toggleappView() {

      setState(() => showSignIn=!showSignIn);
    }

  @override
  Widget build(BuildContext context) {

 

    if(showSignIn)
    {
      return SignIn(toggleappView :toggleappView);
    }else {
      return Register(toggleappView :toggleappView);
    }





  }
}