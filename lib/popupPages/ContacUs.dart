import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  bool isloading=false;

  TextEditingController nameController;
  TextEditingController mailController;
  TextEditingController messageController;

  String name,email,messagel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     nameController=new TextEditingController();
   mailController=new TextEditingController();
     messageController=new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  (isloading)?isLoading():drawForm(),
      ),
    );
  }
  Widget drawForm(){
    return  Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: null,
            decoration: InputDecoration(
              hintText: "enter your name",
            ),
            validator:(value){
              if(value.isEmpty){
                return "this field is requierd";
              }
              else{
                return null;
              }
            },

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: null,
            decoration: InputDecoration(
              hintText: "enter your email",
            ),
            validator:(value){
              if(value.isEmpty){
                return "this field is requierd";
              }
              else{
                return null;
              }
            },

          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            maxLines: 4,
            controller: null,
            decoration: InputDecoration(
              hintText: "enter your messages here",
            ),
            validator:(value){
              if(value.isEmpty){
                return "this field is requierd";
              }
              else{
                return null;
              }
            },

          ),
          SizedBox(
            height: 15,
          ),

          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  name=nameController.text;
                  email=mailController.text;
                  messagel=mailController.text;

                  setState(() {
                    isloading=true;
                  });
                }
                else{
                setState(() {

                  isloading=false;
                });
                }

              },
              child: new Text("send message"),
            ),
          )
        ],
      ),

    );
  }

  Widget isLoading(){
    return Center(
      child: Container(

        child: CircularProgressIndicator(),
      ),
    );
  }



}
