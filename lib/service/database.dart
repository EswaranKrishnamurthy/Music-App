import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseService{

  final String uid;

    DataBaseService({this.uid});

  final CollectionReference user_collection = Firestore.instance.collection('User Data');

Future SaveUserDate(String userName,String email, String password , String phoneNumber)
async {

    return await user_collection.document(uid).setData(
     
      {
          'User Name':userName,
          'Email Id':email,
          'Password' : password,
          'Phone Number': phoneNumber


      }
    );

}






}

