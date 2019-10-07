import 'package:flutter/material.dart';
import 'package:newsapp/hometaps/Favourite.dart';
import 'package:newsapp/hometaps/Poboler.dart';
import 'package:newsapp/hometaps/Whatsnew.dart';
import 'package:newsapp/sharedui/shared_drwar.dart';
class headLine extends StatefulWidget {
  @override
  _headLineState createState() => _headLineState();
}

class _headLineState extends State<headLine> with SingleTickerProviderStateMixin {
  TabController  _controller;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('HeadLineNews',style: TextStyle(fontSize: 22.0),),
        titleSpacing: 0.0,

        actions: <Widget>[

          Row(
            children: <Widget>[

              IconButton(icon: new Icon(Icons.search),onPressed: (){},),
              SizedBox(width: 10.0,),
              Icon((Icons.more_vert)),
              SizedBox(width: 5.0,),
            ]
          )
        ],

        bottom: TabBar(
          tabs: [
            Tab(
              child: new Text("WHATS New"),
            ),
            Tab(
              child: new Text("POBOLER"),
            ),
            Tab(
              child: new Text("FAVOURITE"),
            ),
          ],
          controller: _controller,

        ),
      ),
      drawer: Sdrawer(),


      body: new Center(
        child: TabBarView(

          children: <Widget>[
            whatsnew(),
            popoler(),
            favourite(),
          ],
          controller:_controller ,
        ),

      ),
    );
  }
}
