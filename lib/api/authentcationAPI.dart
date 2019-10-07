import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/utilities/api_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentcationApi{

   Future<bool> Login(String email, String password) async{
     String getAuth=base_api+getTokenforlogin;



     http.Response response= await http.post(
         getAuth,
         headers: {'Accept':"application/json" },
       body:{
           "email":email,
         "password":password
       }
     );

     if(response.statusCode==200){
       try{
         var date=response.body ;
         var jasonData=jsonDecode(date);

         var data=jasonData['data'];
         var apiToken=data["api_token"];
         SharedPreferences  prefs= await SharedPreferences.getInstance();
         prefs.setString("apiToken",apiToken );

         return true;
       }
       catch( Exception){
         return false ;
       }

     }
       return false;


  }
}

