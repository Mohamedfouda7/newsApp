import 'package:flutter/material.dart';
import 'package:newsapp/sharedui/shared_drwar.dart';

class instafeeds extends StatefulWidget {
  @override
  _instafeedsState createState() => _instafeedsState();
}

class _instafeedsState extends State<instafeeds> {

  TextStyle _hastagestyle=new TextStyle(
    color: Colors.orange
  );


  List<int>favId=[0,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("instgrma feeds"),
          centerTitle: false,
          actions: <Widget>[
            new Icon(Icons.search),
          ],
        ),
        drawer: Sdrawer(),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: new Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _drawheadwr(index),
                      _drawtitle(),
                      _drawHastages(),
                      _darwbody(),
                      _drawfooter()
                    ],
                  ),
                ),
              );
            }));
  }

  Widget _drawheadwr(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      "mohamed fouda",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    new Row(
                      children: <Widget>[
                        new Text("Fri,"),
                        new Text("12 May 2017"),
                        new Text("14.30"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: (favId.contains(index))?Colors.red: Colors.grey,
                  ),
                  onPressed: ( ) {
                    if(favId.contains(index)){
                      setState(() {
                        favId. removeAt(index);
                      });
                    }
                    else{
                      setState((){
                        favId.add(index);
                      });
                    }


                  }
                  ),
              Transform.translate(
                child: new Text("25"),
                offset: Offset(-8, 0),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _drawtitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,left: 16,right: 16),
      child: Text(
        "we also talk about the future of work as the ropotes",
        style: TextStyle(color: Colors.grey.shade800),
      ),
    );
  }

  Widget _drawHastages() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: new Text("#Advanced",style: _hastagestyle,),
          ),
          FlatButton(
            onPressed: () {},
            child: new Text("#Advanced",style: _hastagestyle,),
          ),
          FlatButton(
            onPressed: () {},
            child: new Text("#Advanced",style: _hastagestyle,),
          )
        ],
      ),
    );
  }

  Widget _darwbody(){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*.30,
      child: Image(
        image: ExactAssetImage("images/bac.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }
  Widget _drawfooter(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(child: new Text("10 comments",style: _hastagestyle,),onPressed: (){},),

        new Row(
          children: <Widget>[
            Transform.translate(
                offset: Offset(20, 0),
                child: FlatButton(child: new Text("share",style: _hastagestyle),onPressed: (){},)),
            FlatButton(child:   new Text("open",style: _hastagestyle),onPressed: (){},)
          ],
        )
      ],
    );

  }
}
