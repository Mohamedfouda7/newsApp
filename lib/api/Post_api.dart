

import 'package:http/http.dart'  as http;
import 'package:newsapp/models/Post_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/utilities/api_utilities.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:newsapp/models/commentModel.dart';


  import 'package:newsapp/api/Post_api.dart';

  class PostApi{

     List <Comment>postComments=new List<Comment>();
      List <Post> posts=new List<Post>();
    String allPosts=base_api+all_posts;         // for whatsnew method
    String allpostsresentUoade=base_api+all_resenet_update;             // for whatsnew method





   // api method for fetching post to whatsnewdarw cards
    Future<List<Post>> fectchPostByCategoryId(String id) async{
      String all_Posts_popoler=base_api+postsCategories+id;
      http.Response response= await http.get(allPosts);

      if(response.statusCode==200){
        var date=response.body;

        var jsonDate=convert.jsonDecode(date);

        var postDate=jsonDate['data'];
         List datedate=new List();
        datedate=postDate;


        for(var post in postDate){
          Post newPost=Post(
            id:(post['id']).toString(),
            title:post['title'].toString(),
              timeWritten:post['time_written'].toString(),
              content:post["post_content"].toString(),
            voteUp:int.parse(post['vote_up']),
            voteDown:int.parse(post['vote_down']),
              featuredImage:post['Featured_image'].toString(),

              votersUp: (post['voters_up']==null)?new List<int>():   convert.jsonDecode(post['voters_up']),

            votersDown: (post['voters_down']==null)?new List<int>():   convert.jsonDecode(post['voters_down']),

              userId:int.parse(post['user_id']),
              categoryId:int.parse(post['category_id'])

          );

          posts.add(newPost);

        }


    }


  return posts;
    }


      Future<List<Comment>>  getPostComments(String id) async{
      String commentUrl=base_api+commentpost+id;

      http.Response response= await http.get(commentUrl);

      if(response.statusCode==200){
           var jsonResponse=convert.jsonDecode(response.body);
            var data=jsonResponse["data"];


            for(var comment in data){
              Comment commentdata=new Comment(
                comment["id"].toString(),
                  comment["post_id"],
                  comment["user_id"],
                comment["time_written"],
                comment["comment_conntent"]
              );

              postComments.add(commentdata);



            }

           return postComments;
            }

          return null;



    }



  }
