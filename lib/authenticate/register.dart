import 'package:auth_test/authenticate/sign_in.dart';
import 'package:auth_test/service/auth.dart';
import 'package:auth_test/shared/Constants.dart';
import 'package:auth_test/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

final Function toggleappView;

  Register( {this.toggleappView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

    final AuthService _auth=AuthService();
    final _formKey=GlobalKey<FormState>();
    bool loading=false;

    String email='';
    String password='';
    String userName='';
    String phoneNumber='';
    
    String error='';

  @override
  Widget build(BuildContext context) {
   return loading ? Loading() : Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor:Colors.blue,
        elevation: 0.0,
        title: Text('Sign Up'),
        actions:<Widget>[
              FlatButton.icon(
                  icon:Icon(Icons.person),
                  label:Text('Sign In'),
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
                    SizedBox(height:10.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'User Name'),                     
                      validator: (val) => val.isEmpty ? 'Please Enter Your Name' : null,
                      onChanged:(val){
                        setState(() =>userName=val );
                      }
                    ),
                    SizedBox(height:10.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'Email'),
                      validator: (val) => val.isEmpty ? 'Please Enter Email' : null,
                      onChanged:(val){
                        setState(() =>email=val );

                      }
                    ),
                    SizedBox(height:10.0),
                    TextFormField( 
                      decoration: textInputDecoration.copyWith(hintText:'Password'), 
                      validator: (val) => val.length < 6 ? 'Please Enter Strong Password' : null,                    
                      obscureText: true,
                      onChanged:(val){
                        setState(() =>password=val );

                      }


                    ),
                    SizedBox(height:10.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'Phone Number'),                     
                      validator: (val) => val.isEmpty ? 'Please Enter Your Phone Number' : null,
                      onChanged:(val){
                        setState(() =>phoneNumber=val );
                      }
                    ),

                     SizedBox(height:20.0),
                     RaisedButton(
                          color:Colors.pink[200],
                          child: Text('Sign Up',
                          style:TextStyle(
                              color:Colors.black,
                              
                            ),
                          
                          
                          ),
                          onPressed:() async{
                            if(_formKey.currentState.validate())
                            {
                              setState(() =>loading=true);
                               dynamic result=await _auth.registerWithEmailAndPassword(userName,email,password,phoneNumber);
                                if(result == null)
                              {
                                setState(() =>loading=false);
                                setState(() => error='Values Incorrect');
                               }
                               //else if(result.code == "ERROR_INVALID_EMAIL" )
                              // {
                              //   setState(() =>loading=false);
                              //   setState(() => error='Values Incorrect');

                              // }else if(result.code == "ERROR_INVALID_EMAIL" )
                              // {


                              // }

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