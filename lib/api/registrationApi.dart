import 'package:flutter/material.dart';
import 'package:newsapp/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import "dart:async";


class registerAPI{



   Future<bool>  register(String name, String email, String password) async{
      String  regurl=base_api+registerapi;

      http.Response response=await  http.post(
        regurl,
         headers: {
          "Accept":"application/json"
         },
        body: {
           "name":name,
          "email":email,
          "password":password
        }


      );

//      var jsonDate=jsonDecode(response.body);
//
//      var data=jsonDate["data"];
//
//     print(data);

   if(response.request==201){
     print ("toooz");
   }





    }


}