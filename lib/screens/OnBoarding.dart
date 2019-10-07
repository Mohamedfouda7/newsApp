import 'package:flutter/material.dart';
import 'package:newsapp/PageModel.dart';
import 'package:newsapp/screens/registerPage.dart';
import 'home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  ValueNotifier<int> _pagenotifier=ValueNotifier(0);

    void change()async{
      SharedPreferences pref= await SharedPreferences.getInstance();

      pref.setBool("check", true);
    }

  List<PageModel> pages = new List<PageModel>();


  void addpages() {
    pages.add(PageModel(Icons.edit, Colors.black, "images/bac.jpg", "welcome"));
    pages.add(PageModel(Icons.add, Colors.red, "images/bac1.jpg", "welcome"));
    pages.add(PageModel(Icons.map, Colors.black54, "images/bac2.jpg", "welcome",));
    pages.add( PageModel(Icons.access_time, Colors.red, "images/bac3.jpg", "welcome",));

  }


         @override
  void initState() {
    // TODO: implement initStat
    this.addpages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          new PageView.builder(
            itemCount: pages.length,

            itemBuilder: (context, index) {
              return Stack(

                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: ExactAssetImage(pages[index].images),
                      fit: BoxFit.fill,
                    )),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: new Icon(
                          pages[index].icons,
                          size: 150.0,
                          color: pages[index].colors,
                        ),
                        offset: Offset(0, -60.0),
                      ),
                      new Text(
                        pages[index].titles,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 5.0),
                        child: new Text(
                          "making friends eiasy waving your back hand and in easy state ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),


                    ],
                  )
                ],
              );
            },
            onPageChanged: (index){
              _pagenotifier.value=index;
            },
          ),
                  Align(
                    alignment: Alignment.center,
                    child: Transform.translate(
                      child: new Container(
                        child:_pageindicator(pages.length),
                      ),
                      offset: Offset(0,150.0),
                    ),

                  ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 350,
                height: 55.0,
                child: new RaisedButton(
                  color: Colors.pink,

                  child: new Text(
                    "GET STARTED",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),

                  ),
                  onPressed: () {
                       //change();
                    Navigator.push(context, MaterialPageRoute(builder: ( context){
                      change();
                      return Registeration();
                    }));

                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _pageindicator(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pagenotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.red,
        ),
      ),
    );
  }


}
