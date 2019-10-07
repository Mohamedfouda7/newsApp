import 'package:flutter/material.dart';
import 'package:newsapp/api/Post_api.dart';
import 'package:newsapp/models/Post_model.dart';
import 'package:newsapp/screens/singlePost.dart';

import 'package:newsapp/utilities/functions_utitlity.dart';

class popoler extends StatefulWidget {
  @override
  _popolerState createState() => _popolerState();
}

class _popolerState extends State<popoler> {
  PostApi _postApi=new  PostApi();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _postApi.fectchPostByCategoryId("3"),
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
           if(snapshot.data!=null){
                    List<Post>allposts=snapshot.data;
                    if(allposts.length>0){
                      return ListView.builder(
                        itemBuilder: (context,int index ){
                          return drawcard(allposts[index]);

                        },
                        itemCount: allposts.length,


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

    );
  }


  Widget drawcard( Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Singlepost(post);
          }));
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: NetworkImage(post.featuredImage),
                fit: BoxFit.cover,
              ),
              width: 120,
              height: 120,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  new Text("The World Global Warnning An annal Summit",
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
                          new Text(Parsehumendatetime(post.timeWritten))
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
}
