import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auth_test/service/auth.dart';
import 'package:flutter/material.dart';




class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
 
final AuthService _auth=AuthService();


      Duration _duration=Duration();
      Duration _position=Duration();
      AudioPlayer advancedPlayer;
      AudioCache audioCatcher;

  @override
  void initState(){
    super.initState();
    initPlayer();

  }

void initPlayer(){
  advancedPlayer=AudioPlayer();
  audioCatcher=AudioCache(fixedPlayer: advancedPlayer);

  advancedPlayer.durationHandler=(d)=> setState((){
      _duration=d;

  });

  advancedPlayer.positionHandler=(p)=> setState((){
      _position=p;

  });


}



String localFilePath;


Widget _tab(List<Widget>children)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children:children
            .map((w)=> Container(child:w , padding:EdgeInsets.all(6.0)))
            .toList()
          ),

        )


    ],

  );


}


Widget _btn(String txt, VoidCallback onPressed){

  return ButtonTheme(
      minWidth:50.0,
      child:Container(
          width:150,
          height:45,
          child:RaisedButton(

              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child:Text(txt),
              color: Colors.pink[900],
              textColor: Colors.white,
              onPressed:onPressed

          ) ,  

      ),

  );
}


Widget slider()
  {

          return Slider(
            activeColor: Colors.black,
            inactiveColor:Colors.pink,
            value:_position.inSeconds.toDouble(),
            min:0.0,
            max:_duration.inSeconds.toDouble(),
            onChanged: (double value){

                  setState(() {
                    seekToSecond(value.toInt());
                    value=value;
                  });

            },


          );

  }




  Widget localAudio(){

      return _tab([

        _btn('Play', ()=> audioCatcher.play('./../../assets/MELAY_KERI.MP3')),
        _btn('Pause', () => advancedPlayer.pause()),
        _btn('Stop', () => advancedPlayer.stop() ),
        slider()


      ]);

  }


void seekToSecond (int second )
{
    Duration newDuration = Duration(seconds:second);
    advancedPlayer.seek(newDuration);

}


























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
                      await _auth.signOut();

                  },

              )

            ],
          ),
          body: TabBarView(

                children: <Widget>[localAudio()],
          ),
      ),
    );


  }
}