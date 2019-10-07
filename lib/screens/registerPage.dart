import "package:flutter/material.dart";
import 'package:newsapp/api/registrationApi.dart';
import 'LoginPage.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  registerAPI reg=new registerAPI();

  final _formkey=GlobalKey<FormState>();
  bool isloading=false;
  String name,email,password;

  TextEditingController nameController;
  TextEditingController mailController;
  TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=new TextEditingController();
    mailController=new TextEditingController();
    passController=new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(

              colors: [Colors.grey,Colors.transparent,Colors.grey],
            begin: Alignment.topRight,
            end:  Alignment.bottomLeft,
            stops:[

              0.1,
              0.4,
              0.6,
            ]

          )
        ),


        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top:150),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text("Create Account",style: TextStyle(fontSize:30,fontWeight: FontWeight.w500),),

                  (isloading)? isLoading(): drawForm(),
                  SizedBox(
                    height: 40,
                  ),

                  Text("Already Have An Account?",style: TextStyle(fontSize: 15),),

                  FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return new Login();
                      }));
                    },

                    child: Text("Login",style: TextStyle(fontSize: 15,color: Colors.purple),),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget  drawForm() {
    return  Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
            key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "enter your name",
              ),
              validator: (value){
                if(value.isEmpty){
                  return "this field is required";
                }
                else {
                  return null;
                }
              },

            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                labelText: "E_mail",
                hintText: "enter your email",
              ),
              validator: (value){
                if(value.isEmpty){
                  return "this field is required";
                }
                else {
                  return null;
                }
              },

            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "enter your password",
              ),
              validator: (value){
                if(value.isEmpty){
                  return "this field is required";
                }
                else {
                  return null;
                }
              },

            ),
            SizedBox(height: 30,),
            Container(

              width: double.infinity,
              child: RaisedButton(
                color: Colors.deepPurpleAccent,
                onPressed: ()async{
                      if(_formkey.currentState.validate()){
                       setState(() {
                         isloading=true;
                       });

                       name=nameController.text;
                       email=mailController.text;
                       password=passController.text;

                       bool response= await  reg.register(name, email, password);

                       if(response){
                         print ("ya homaar");
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                           return new Login();
                         }));
                       }


                      }
                      else{
                        setState(() {
                          isloading=false;
                        });
                      }

                },

                child: new Text("Create Account"),
              ),
            )
          ],
        ),


      ),
    );
  }

  Widget isLoading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
