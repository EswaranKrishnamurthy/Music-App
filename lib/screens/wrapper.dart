import 'package:auth_test/authenticate/authenticate.dart';
import 'package:auth_test/authenticate/register.dart';
import 'package:auth_test/authenticate/sign_in.dart';
import 'package:auth_test/model/user.dart';
import 'package:auth_test/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      final user = Provider.of<User>(context);
      

    //return Home or Authenticate
    if(user == null)
    {
          return Authenticate();

    }else {
    return Home();
    }
  }
}