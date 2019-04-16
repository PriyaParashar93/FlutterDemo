import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/NavDrawer.dart';
import 'package:flutter_appasd/src/animation/StickerAnimation.dart';
import 'package:flutter_appasd/src/animation/saveImageOnCanvas.dart';
import 'package:flutter_appasd/src/stickers/StickersPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the ro1
  //
  //
  //
  //
  //
  //
  //
  //\ot of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
//        canvasColor: Colors.transparent,


      ),
//      home: NavDrawer(),
//      home: LinkedInExamplePage(),
      home: StickerPage(),
//      home: SaveImg(title: "Animation",),
//      home: StickerAnim(title: "Animation"),

//      home: HomePageState(),
//      home: SignupScreen(title: 'Register User'),
//      home: SaveImg(title: "SaveImg",),
//      home: Login(),

    );
  }



}
