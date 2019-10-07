import 'package:flutter/material.dart';
import 'package:newsapp/api/Post_api.dart';
import 'package:newsapp/api/authors_api.dart';
import 'package:newsapp/models/author_model.dart';
import 'package:newsapp/models/commentModel.dart';
import 'package:newsapp/utilities/themeforallapp.dart' as themes;
import 'package:newsapp/sharedui/shared_drwar.dart' ;
import 'package:newsapp/hometaps/Favourite.dart';
import 'package:newsapp/hometaps/Poboler.dart' ;
import 'package:newsapp/hometaps/Whatsnew.dart' ;

import"package:newsapp/popupPages/About.dart";
import "package:newsapp/popupPages/ContacUs.dart";
import 'package:newsapp/popupPages/Help.dart';
import 'package:newsapp/popupPages/Settings.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}
enum PopUpMenu{
  HELP,ABOUT,CONTACT,SETTING


}
class _homescreenState extends State<homescreen> with SingleTickerProviderStateMixin {

  var _selection=PopUpMenu.ABOUT;

 // List<Comment> comments;



  TabController  _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(initialIndex: 1,length: 3, vsync: this);

  }

  @override
  Widget build(BuildContext context)  {


    return Scaffold(
          appBar: new AppBar(
            elevation: 0.0,
            title: new Text('Explore',style: TextStyle(fontSize: 22.0),),
            titleSpacing: 0.0,

            actions: <Widget>[

             Row(
               children: <Widget>[

                 IconButton(icon: new Icon(Icons.search),onPressed: (){},),
                 SizedBox(width: 10.0,),

                 _popoutmenu(),
                 SizedBox(width: 5.0,),
               ],
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

Widget  _popoutmenu() {
     return PopupMenuButton<PopUpMenu>(


     itemBuilder: (BuildContext context){
         return [
            PopupMenuItem<PopUpMenu>(
             value: PopUpMenu.HELP,
             child: Text('HELP'),
           ),
            PopupMenuItem<PopUpMenu>(
             value: PopUpMenu.CONTACT,
             child: Text('CONTACT'),
           ),
           PopupMenuItem<PopUpMenu>(
             value: PopUpMenu.ABOUT,
             child: Text('ABOUT'),
           ),
           PopupMenuItem<PopUpMenu>(
             value: PopUpMenu.SETTING,
             child: Text('SETTING'),
           ),
         ];
       },
       onSelected: (  PopUpMenu value){

       switch(value){
         case PopUpMenu.HELP:

           Navigator.push(context, MaterialPageRoute(builder: (context){
             return Help();
           }));
           break;
         case PopUpMenu.ABOUT:
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return AboutUs();
           }));
           break;
         case PopUpMenu.CONTACT:
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return ContactUs();
           }));
           break;
         case PopUpMenu.SETTING:
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return Setting();
           }));
           break;
       }


       },


     );
}
}
