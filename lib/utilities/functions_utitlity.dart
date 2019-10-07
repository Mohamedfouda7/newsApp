
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget connectionErorr(){
  return Container(
    child: new Text(" there is no connection"),
  );
}

Widget  hasError(var error){
  return Container(
    child: new Text( error.toString()),
  );
}

Widget noData(){
  return Container(
    child: new Text("the oject has no date"),
  );
}

Widget loading(){
  return Container(

    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
String Parsehumendatetime( String dateTime){
  final now = new DateTime.now();
  DateTime posttime=DateTime.parse(dateTime);
  Duration   timago =now.difference(posttime) ;
  DateTime difeerence=now.subtract(timago);
  return timeago.format(difeerence);
}