import 'package:flutter/material.dart';
import 'package:newsapp/sharedui/shared_drwar.dart';

class twitterfeed extends StatefulWidget {
  @override
  _twitterfeedState createState() => _twitterfeedState();
}

class _twitterfeedState extends State<twitterfeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Twiiter Feeds"),
        centerTitle: false,
        actions: <Widget>[
          new Icon(Icons.search),
        ],
      ),
      drawer: Sdrawer(),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "mohamed Fouda",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                new Text(
                                  "@fouda",
                                  style: TextStyle(fontSize: 16.0),
                                )
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Text("Fri,"),
                                new Text("12 May 2017"),
                                new Text("14.30"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: new Text(
                          "we also tack obout the future of work as the ropots advancedand we ask whether a retro phone ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ))),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                     new Container(
                       color: Colors.grey.shade500,
                       height: 1,
                     ),
                    SizedBox(
                      height: 5,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.repeat,
                                color: Colors.amber,
                              ),
                              onPressed: () {},
                            ),
                            new Text("25"),
                          ],
                        ),
                        SizedBox(width: 70,),
                        new Row(
                          children: <Widget>[
                            FlatButton(
                                child: new Text(
                              "SHARE",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),

                            ),
                            onPressed: (){},),

                            FlatButton(
                                child: new Text("OPEN",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              onPressed: (){},),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
