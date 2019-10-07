import "package:flutter/material.dart";
import 'package:newsapp/screens/OnBoarding.dart';
import 'package:newsapp/screens/home-screen.dart';
import 'package:newsapp/screens/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newsapp/utilities/themeforallapp.dart';


void main() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool visit = pref.getBool("check");
  Widget _screen;


  if (visit == null || visit == false) {
    _screen = new OnBoarding();
  } else {
    _screen = new Registeration();
  }
  runApp(new NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  Widget screen;
  NewsApp(this.screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:apptheme.appthemes,
      home: screen,
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new Registeration(),
      },
    );
  }
}
