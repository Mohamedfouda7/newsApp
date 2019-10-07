import 'package:flutter/material.dart';
import "package:newsapp/models/navigationMode.dart";
import 'package:newsapp/screens/facebookfeeds.dart';
import 'package:newsapp/screens/home-screen.dart';
import 'package:newsapp/screens/HeadLineNews.dart';
import 'package:newsapp/screens/instgarmfeed.dart';
import 'package:newsapp/screens/twitter_feed.dart';
import 'package:newsapp/screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sdrawer extends StatefulWidget {

  @override
  _SdrawerState createState() => _SdrawerState();
}

class _SdrawerState extends State<Sdrawer> {
   SharedPreferences preferences;
   String token;
  bool isloggedin=false;

  List<menuItemNav> navmenu=[
    menuItemNav("Explore",()=> homescreen()),
    menuItemNav("Head Line News",()=>headLine()),
    menuItemNav("Twitter Feeds",()=>twitterfeed()),
    menuItemNav("instgram Feeds",()=>instafeeds()),
    menuItemNav("facebook feeds",()=>fbfeeds()),
    menuItemNav("Login",()=>Login())
  ];

    getToken()async{
      preferences=await SharedPreferences.getInstance();
      token=preferences.get("apiToken");
     setState(() {
       if(token!=null){
         isloggedin=true;
       }
     });
    }

    setLogout(){
      setState(() {
        if(isloggedin){
          navmenu.add(menuItemNav("LogOut",logout));
        }
      });
    }

   logout(){
     if(token!=null){
      // preferences.remove("apiToken");
       return new homescreen();
      }
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    setLogout();
  }



  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: new Padding(
        padding: EdgeInsets.only(top: 100.0, left: 20.0),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                title: new Text(
                  navmenu[index].title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                trailing: new Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                    return  navmenu[index].destination();
                  }));
                },
              ),
            );
          },
          itemCount: navmenu.length,
        ),
      ),
    );
  }
}
