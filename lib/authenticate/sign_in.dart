import 'package:auth_test/authenticate/register.dart';
import 'package:auth_test/model/user.dart';
import 'package:auth_test/service/auth.dart';
import 'package:auth_test/shared/Constants.dart';
import 'package:auth_test/shared/loading.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {

  final Function toggleappView;

  SignIn( {this.toggleappView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth=AuthService();
final _formKey=GlobalKey<FormState>();
bool loading=false;
 
String email='';
String password='';
String error='';

  @override
  Widget build(BuildContext context) {
    return loading?Loading(): Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor:Colors.blue,
        elevation: 0.0,
        title: Text('Sign In'),
          actions:<Widget>[
              FlatButton.icon(
                  icon:Icon(Icons.person),
                  label:Text('Sign Up'),
                  onPressed: () async {
                     widget.toggleappView();

                  },

              )

            ],
      ),
      body: Container(
          padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
          child:Form(
            key:_formKey,
            child: Column(
                  children: <Widget>[
                    SizedBox(height:20.0),
                    TextFormField(
                     decoration: textInputDecoration.copyWith(hintText:'Email'), 
                     validator: (val) => val.isEmpty ? 'Please Enter Email' : null,
                      onChanged:(val){
                        setState(() =>email=val );

                      }
                    ),
                    SizedBox(height:20.0),
                    TextFormField(   
                      decoration: textInputDecoration.copyWith(hintText:'Password'),   
                      validator: (val) => val.length < 6 ? 'Please Enter Strong Password' : null,                    
                      obscureText: true,
                      onChanged:(val){
                        setState(() =>password=val );

                      }


                    ),

                     SizedBox(height:20.0),
                     RaisedButton(
                          color:Colors.pink[200],
                          child: Text('Sign In',
                          style:TextStyle(
                              color:Colors.black,
                              
                            ),
                          
                          
                          ),
                          onPressed:() async{
                              
                            if(_formKey.currentState.validate())
                            {
                              setState(() =>loading=true);
                               dynamic result=await _auth.signInWithEmailAndPassword(email,password);
                                 if(result == null)
                               {
                                 setState(() =>loading=false);
                                 setState(() => error='Not able to signin');
                               }

                            }
                          }

                     ),
                     SizedBox(height: 12.0),
                     Text(
                       error,
                       style: TextStyle(color:Colors.red, fontSize: 12.0),
                     )
                  ],


            )
            
            
            
            )

      ),

      );
  }
}