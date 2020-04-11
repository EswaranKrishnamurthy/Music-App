
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
   

 return DefaultTabController(
      length: 1,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.blue,
            title:Text("Local Audio Player"),
             actions:<Widget>[
              FlatButton.icon(
                  icon:Icon(Icons.person),
                  label:Text('Logout'),
                  onPressed: () async {
                     // await _auth.signOut();

                  },

              )

            ],
          ),
     
      ),
    );


  }
}

