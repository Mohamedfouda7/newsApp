import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


  Future<bool>  isLoggedIn() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

     bool islogedin=prefs.get("islogedin");

     if(islogedin){return true;}
     return false;

}