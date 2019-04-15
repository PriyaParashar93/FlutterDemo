import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/loginWithbloc/ValidationBloc.dart';
import 'package:flutter_appasd/src/signup/SignupScreen.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<Login> {
  var validation = new ValidationBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      key:_scaffoldKey ,
      body: Container(
        padding: EdgeInsets.all(30.0 ),
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.blue[200],
              Colors.blue[50],
              Colors.blue[50],
              Colors.blue[200],
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: validation.outCounter,
              builder: (context, snapshot) {
                return TextField(
                  onChanged:
                    validation.emailValidation,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'ypu@example.com',
                    labelText: 'Email Address',
                    errorText: snapshot.error,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: StreamBuilder(
                stream: validation.passStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: validation.passValidation,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      errorText: snapshot.error,
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupScreen(
                              title: "Register User",
                            )),
                  ),
              child: Text("New User ?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
            ),



            StreamBuilder(
              stream: validation.btnStream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.all(40.0),
                  child: RaisedButton(
                      child: Text('Login'),
                      color: Colors.blue,
                      disabledColor: Colors.black12,
                      disabledTextColor: Colors.black45,
                      textColor: Colors.white,
                      onPressed: (snapshot.hasData && snapshot.data) ? validation.submit() : null,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }





}
