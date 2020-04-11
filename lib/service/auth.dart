import 'package:auth_test/model/user.dart';
import 'package:auth_test/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

final FirebaseAuth _auth= FirebaseAuth.instance;

//Convert to user Model
User _userModelGenerate(FirebaseUser user){

    return (user != null)? User(uid:user.uid) : null;

}


// User Stream
Stream<User>get user {
      return _auth.onAuthStateChanged .map(_userModelGenerate);
}


//sign in with anon

Future signInAnon () async {

  try{
       AuthResult result =   await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userModelGenerate(user);
  }catch(e){

      print(e.toString());
      return null;
  }
}



//sign in with email and password

Future registerWithEmailAndPassword(String userName,String email,String password,String phoneNumber) async
{
  
      try{
          AuthResult result = await _auth.createUserWithEmailAndPassword(email:email, password: password);
          FirebaseUser user = result.user;

          DataBaseService(uid:user.uid).SaveUserDate(userName,email, password, phoneNumber);
          return _userModelGenerate(user);

      }catch(e){
            return null;
      }


}

// regiester with email and password

Future signInWithEmailAndPassword(String email,String password) async
{
      try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email:email, password: password);
          FirebaseUser user = result.user;
          return _userModelGenerate(user);

      }catch(e){
return null;
      }


}

// Sign out
Future signOut () async {

  try{
      return await _auth.signOut();
  }catch(e){

      print(e.toString());
      return null;
  }
}


}