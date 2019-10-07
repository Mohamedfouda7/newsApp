import "package:flutter/material.dart";
import 'package:newsapp/api/Post_api.dart';
import "package:newsapp/models/Post_model.dart";
import 'dart:math';

import 'package:newsapp/models/commentModel.dart';
import 'package:newsapp/utilities/functions_utitlity.dart';

class Singlepost extends StatefulWidget {
  final Post newpost;

  Singlepost(this.newpost);

  @override
  _SinglepostState createState() => _SinglepostState();
}

class _SinglepostState extends State<Singlepost> {
  PostApi _postapi=new PostApi();
  List<Comment>allpostComment;

  Random ran = new Random();

  List<Color> colors = [Colors.orange, Colors.teal, Colors.red, Colors.grey];
  Color getrandomcolors() {
    int pos = ran.nextInt(colors.length);
    return colors[pos];
  }
   @override
  void initState()  {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.newpost.featuredImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return _drawPostDetails();
                } else if (index >= 1 && index <= 23) {

                  return FutureBuilder(
                      future: _postapi.getPostComments(widget.newpost.id),
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
                            allpostComment=snapshot.data;
                               int index=ran.nextInt(allpostComment.length);
                                 Comment comment=allpostComment[index];
                                 return _comment(comment);
                            }
                            else {
                              return noData();
                            }
                          }
                          break;
                      }},
                       );

                } else {
                  return enterComment();
                }
              },
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPostDetails() {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text(
              widget.newpost.content,
              style: TextStyle(fontSize: 18, letterSpacing: 1.1, height: 1.2),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height:1,
          color: Colors.black26,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: Text("Comments(23)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
        )
      ],
    );
  }

  Widget _comment( Comment comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.newpost.featuredImage),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "mohamed fouda",
                    style: TextStyle(fontSize: 14),
                  ),
                  new Text("3 mins ago")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 30),
          child: new Text(
            comment.content,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }

  Widget enterComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "enter your comment",
                        border: InputBorder.none,
                        //  fillColor:Colors.grey,
                        //   filled: true
                        contentPadding:
                            EdgeInsets.only(top: 5, left: 5, bottom: 5)),
                  ),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "SEND",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
