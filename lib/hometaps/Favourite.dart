import 'dart:math';
import 'dart:ui';



import 'package:flutter/material.dart';


class favourite extends StatefulWidget {
  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {

  Random random=new Random();
  List<Color>colorsList=[
    Colors.teal,
    Colors.deepOrange,
    Colors.blue,
    Colors.pink,
    Colors.amber

  ];

  Color chosseColor(){
    return colorsList[random.nextInt(colorsList.length)];
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemBuilder: (context, int index){
              return  Card(
                   child: new Container(
                       child: new Column(
                         children: <Widget>[
                             _titleRow(),
                               ba2yrow(),
                         ],
                       ),
                   ),
              );

            },


    );
  }
  Widget _titleRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(

        children: <Widget>[
          Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:ExactAssetImage("images/bac.jpg"),
                    fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle
                ),
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: 10.0  ),
          ),

          Column(
            children: <Widget>[
              Text("Micheal Adams"),
              SizedBox(height: 5.0,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("15 min"),
                  SizedBox(width: 8.0,),
                  Text("Life Style",style: TextStyle(
                      color: chosseColor(),
                      fontWeight: FontWeight.w800
                  ),)
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: IconButton( icon:Icon(Icons.bookmark_border)),
          ),

        ],
      ),
    );
  }

 Widget ba2yrow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                  image: ExactAssetImage("images/bac.jpg"),
                width: 90,
                height: 90 ,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text("Tect time:Old Phones and Safe Social",style: TextStyle(fontWeight:FontWeight.w800,),),
                  SizedBox(height: 10.0,),
                  Text("Tect time:Old Phones and Safe Social"
                      " Tect time:Old Phones and Safe Social Tect time:"
                      "Old Phones and Safe Social",
                    style: TextStyle(fontWeight:FontWeight.w200,),),
                ],
              ),
            )
          ],
      ),
    );
 }
}




