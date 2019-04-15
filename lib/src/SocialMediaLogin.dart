import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';



// @TODO IMPORTANT - you need to change variable values below
// You need to add your own data from LinkedIn application
// From: https://www.linkedin.com/developers/
// Please read step 1 from this link https://developer.linkedin.com/docs/oauth2
final String redirectUrl = 'https://www.brainmobi.com';
final String clientId = '815hd8n9g4nkm0';
final String clientSecret = 'BITk60sWZI61m7pZ';


class LinkedInExamplePage extends StatefulWidget {
  @override
  State createState() => _LinkedInExamplePageState();
}

class _LinkedInExamplePageState extends State<LinkedInExamplePage> {
  UserObject user;
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: 'kkOvaF1Mowy4JTvCxKTV5O1WF',
    consumerSecret: 'ZECGsI6UUDBEUVGkJe4S5vd0FGqGxC3wMJCgsXgPRfjSwRFnyH',
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('LinkedIn login'),
    ),
    body: Center(
      child: Container(
          child: user == null
              ?Column(
            children: <Widget>[
              LinkedInButtonStandardWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LinkedInUserWidget(
                            redirectUrl: redirectUrl,
                            clientId: clientId,
                            clientSecret: clientSecret,
                            onGetUserProfile:
                                (LinkedInUserModel linkedInUser) {
                              print(
                                  'Access token ${linkedInUser.token.accessToken}');

                              user = UserObject(
                                firstName: linkedInUser
                                    .firstName.localized.label,
                                lastName:
                                linkedInUser.lastName.localized.label,
                                email: linkedInUser.email.elements[0]
                                    .handleDeep.emailAddress,
                              );

                              setState(() {});
                              Navigator.pop(context);



                            },
                            catchError: (LinkedInErrorObject error) {
                              print(
                                  'Error description: ${error.description},'
                                      ' Error code: ${error.statusCode.toString()}');
                              setState(() {});
                            },
                          ),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              RaisedButton(
                child: new Text('Twitter Log in'),
                onPressed: _twitterLogin,
              ),
            ],
          )

              : Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('First: ${user.firstName} '),
                Text('Last: ${user.lastName} '),
                Text('Email: ${user.email}'),
              ],
            ),
          )),
    ),
  );


  void _twitterLogin() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    UserObject newUser;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        {user.firstName=result.session.username;
user.lastName=result.session.userId;
user.email="abc.gmail.com";
          break;
        }
      case TwitterLoginStatus.cancelledByUser:
        print('Login cancelled by user.');
        break;
      case TwitterLoginStatus.error:
        print('Login error: ${result.errorMessage}');
        break;
    }

    setState(() {
      if(newUser!=null)
      user = newUser;
    });
  }

 /* void _twitterLogout() async {
    await twitterLogin.logOut();

    setState(() {
      _message = 'Logged out.';
    });
  }*/
}

class UserObject {
  String firstName, lastName, email;

  UserObject({this.firstName, this.lastName, this.email});
}



