
import 'package:http/http.dart'  as http;
import 'package:newsapp/models/category_model.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:newsapp/utilities/api_utilities.dart';



class CategoriesApi{

  String allCategories=base_api+all_categories;

  List <  Category> allCateggories=new List<Category>();

  Future <List<Category>> fetchAllCategories() async{

              http.Response respons=await http.get(allCategories);
    if(respons.statusCode==200)
             {
               var date=respons.body;

               var JsonCategory=convert.jsonDecode(date);

               var CategoryList=JsonCategory['data'];

               for (var cat in CategoryList){
                 Category category=Category(cat["id"].toString(), cat["title"].toString());
                 allCateggories.add(category);

               }

             }



              return allCateggories;
          }



}