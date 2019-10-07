
import 'package:newsapp/models/author_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:core';

import 'package:newsapp/utilities/api_utilities.dart';

class AuthorsApi {

  List <Author> authors=new List<Author>();                   //list of all authors

   String allAuthors =base_api+all_authors_api ;                //the url of all authors with get request
  Future <List<Author>> fetchAllAuthors() async {
    // ignore: non_constant_identifier_names
    http.Response Response = await http.get(allAuthors);
   if(Response.statusCode==200){
     var date=Response.body;
     var jsonDate=convert.jsonDecode(date);
     var authorDate=jsonDate['data'];
     for (var item in authorDate){
       Author author=new Author(item["id"].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
       authors.add(author);
     }
   }
      else{
        print("not connected");
   }



    return authors;

  }

  
}