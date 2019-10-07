import 'dart:math';

import 'package:flutter/material.dart';
import "package:newsapp/api/Post_api.dart";
import 'package:newsapp/screens/singlePost.dart';
import"dart:async" ;

import 'package:newsapp/utilities/functions_utitlity.dart';

import 'package:newsapp/models/Post_model.dart';

class whatsnew extends StatefulWidget {
  @override
  _whatsnewState createState() => _whatsnewState();
}

class _whatsnewState extends State<whatsnew> {

  PostApi _postApi=new PostApi();

  Random random=new Random();


  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _darwheader(),
          _drawtopstories(),
          _resentupdate()

        ],
      ),
    );
  }

  Widget _darwheader() {
    TextStyle _textstyle = new TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    );

    return FutureBuilder(
      future: _postApi.fectchPostByCategoryId("4"),
      builder: (context,AsyncSnapshot snapshot){

        switch(snapshot.connectionState){
          case ConnectionState.none:
           return connectionErorr();

            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
          if(snapshot.hasError){
            return hasError(snapshot.error);
          }
          else{
            if(snapshot.hasData){
                 List<Post>posts=snapshot.data;
                 int index=random.nextInt(posts.length);
                 Post thepost=posts[index];
                   return GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return  Singlepost(thepost);
                       }));
                     },
                       child: Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height * .25,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             image:NetworkImage(thepost.featuredImage),
                             fit: BoxFit.cover,
                           ),
                         ),
                         child: new Center(
                           child: new Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(right: 24.0, left: 24.0, top: 33),
                                 child: new Text(
                                   "mu name is mohamed abd elazeam ",
                                   style: _textstyle,
                                   textAlign: TextAlign.center,
                                 ),
                               ),
                               SizedBox(
                                 height: 5.0,
                               ),
                               new Text(
                                 thepost.content.substring(0,100),
                                 style: _textstyle,
                                 textAlign: TextAlign.center,
                               ),
                             ],
                           ),
                         ),
                       ),
                   );
            }
            else{
              return noData();
            }
          }

            break;
        }

      },

    );
  }

  Widget _drawtopstories() {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 8),
            child: _Writetext("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: new Card(
              child: FutureBuilder(

                   future:_postApi.fectchPostByCategoryId("1") ,
                  builder: (context, AsyncSnapshot snapshot ){
                    switch(snapshot.connectionState ){

                      case ConnectionState.none:
                        return connectionErorr();
                        break;
                      case ConnectionState.waiting:
                         return loading();
                        break;
                      case ConnectionState.active:
                        return  loading();
                        break;
                      case ConnectionState.done:
                        if(snapshot.error!=null){
                                return hasError(snapshot.error);
                        }
                        else{
                          if(snapshot.hasData){
                            List<Post> posts=snapshot.data;
                            if(posts.length>=3)
                           {
                             Post post1 =  snapshot.data[0];
                             Post post2 =snapshot.data[1];
                             Post post3 =snapshot.data[2];
                             return   Column(
                               children: <Widget>[
                                 drawcard(post1),
                                 Divider(),
                                 drawcard(post2),
                                 Divider(),
                                 drawcard(post3)
                               ],
                             );
                           }
                            else {
                              return noData();
                            }
                          }
                          else{
                            return noData();
                          }
                        }
                        break;
                    }

                  },


              ),
            ),
          ),


        ],
      ),
    );
  }








  Widget Divider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget drawcard( Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Singlepost(post);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image.network(post.featuredImage,fit: BoxFit.cover,),
              width: 120,
              height: 120,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(post.title,
                      style:
                          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                      maxLines: 2),
                  SizedBox(
                    height: 30,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("MisealADams"),
                      new Row(
                        children: <Widget>[
                          new Icon(Icons.timer),
                          new Text(Parsehumendatetime(post.timeWritten),style: TextStyle(fontSize: 10),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget _Writetext(String s) {
    return new Text(
      "$s",
      style: TextStyle(color: Colors.grey.shade800),
    );
  }

  Widget _resentupdate(){
    return   Padding(
      padding: const EdgeInsets.only(top: 12, left: 8),
      child: FutureBuilder(
        future: _postApi.fectchPostByCategoryId("2"),
        builder: (context,AsyncSnapshot  snapshot){
          
          switch(snapshot.connectionState){
            
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
                
              break;
              
            case ConnectionState.none:
              return connectionErorr();
              break;
           
            case ConnectionState.done:
             if(snapshot.hasError){
                 return hasError(snapshot.error);
             }
             else{
               if(snapshot.hasData){
                 List<Post>posts=snapshot.data;
                 if(posts.length>=2){
                   
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: _Writetext("Resent Updates"),
                       ),
                       _resentupdateCard("sport",Colors.deepOrange,posts[0]),
                       _resentupdateCard("life style",Colors.teal,posts[1]),
                       SizedBox(
                         height: 48,
                       )
                     ],
                   );
                 }
                 else{
                   return noData();
                 }
                 
               }
               else {
                 return noData();
               }
             }
              break;
          }
          
      
        },
       
      ),
    );
  }
Widget  _resentupdateCard(String txtTitle,Color color,Post post) {
    return Card(
             child: GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return Singlepost(post);
                 }));
               },
               child: new Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                        SizedBox(
                          child: Image.network(post.featuredImage,fit: BoxFit.cover,),
                        ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           decoration: BoxDecoration(
                               color: color,
                             borderRadius: BorderRadius.circular(4)
                           ),

                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                                  child: Text("$txtTitle",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w800),),
                                ),

                         ),
                       ),
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: new Text("Vettal Is Ferrari Number One -Hamlton",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800),),
                         ),
                   new Row(
                     children: <Widget>[
                       new Icon(Icons.timer),
                       Text(Parsehumendatetime(post.timeWritten)),

                     ],
                   )
                 ],
               ),
             ),

    );
}
}
