import 'package:flutter/material.dart';
import 'package:newsapp/api/authentcationAPI.dart';
import 'home-screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthentcationApi authApi = new AuthentcationApi();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool loginerror = false;

  TextEditingController email;
  TextEditingController pass;

  String userMail;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = new TextEditingController();
    pass = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (isLoading) ? loading() : _DrawForm(),
      ),
    );
  }

  Widget loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _DrawForm() {
    if (loginerror) {
      return Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("login failed "),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    loginerror = false;
                    email.clear();
                    pass.clear();
                  });
                },
                child: Text("Try Again"),
              )
            ],
          ),
        ),
      );
    }

    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: email,
              validator: (value) {
                if (value.isEmpty) {
                  return "this field is requierd";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "enter your email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: pass,
              validator: (value) {
                if (value.isEmpty) {
                  return "this field is requierd";
                }
                return null;
              },
              decoration: InputDecoration(labelText: "enter your password"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      isLoading = true;
                    });

                    userMail = email.text;
                    password = pass.text;

                    var ressponse = await authApi.Login(userMail, password);

                    if (ressponse) {
                      setState(() {

                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new homescreen();
                      }));

                      setState(() {
                        isLoading = false;

                      });
                    } else {
                      loginerror = true;
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                child: Text("Login"),
              ),
            )
          ],
        ));
  }
}
