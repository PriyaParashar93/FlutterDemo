import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/stickers/AnimModel.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class StickerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StickerState();
  }

}

class StickerState extends State<StickerPage> {
  var images = ['images/emoge_one.png',
  'images/emoge_two.jpg',
  'images/emoge_three.png',
  'images/emoge_four.png',
  'images/emoge_five.png'
  ];

  double _zoom;
  double _previousZoom;
  Offset _previousOffset;
  Offset _offset;
  Offset _position;
  String _img;
  List<Widget> _widgets;
  List<AnimModel> _model;
  int pos=0;




  @override
  void initState() {
    _zoom = 1.0;
    _previousZoom = null;
    _offset = Offset.zero;
    _position = Offset(0.0, 0.0);
    _widgets=List();
    _model=List();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[
        Positioned(
        bottom: 0.0,
        right: 0.0,
        child: FloatingActionButton(
          onPressed: () {
            showEmoges(context);
          },
          child: Icon(Icons.add),
        ),
      ),


  Stack(
     children: _widgets,

      ),
        ],
      ),
    );
  }

  void showEmoges(context) {
    showModalBottomSheet(context: context, builder: (BuildContext) {
      return GridView.count(crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          return Center(
              child: InkWell(
                onTap: () {
                  addImg(images[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(images[index]),
                ),
              )
          );
        }),
      );
    });
  }

  void _handleScaleStart(ScaleStartDetails start) {

    setState(() {
      _previousOffset = _offset;
      _previousZoom = _zoom;
    });
  }

  void _handleScaleUpdate(ScaleUpdateDetails update) {
    setState(() {
      _zoom = _previousZoom * update.scale;
    });
  }

  _getWidget(img){
    return  Positioned(
      left :_position.dx,//horizontal
      top: _position.dy,
      child:Draggable( //drag and drop
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          width: 350.0,
          height: 450.0,
          child:  GestureDetector( //zoom
            onScaleStart: _handleScaleStart,
            onScaleUpdate: _handleScaleUpdate,
            child: new Transform(
              transform: new Matrix4.diagonal3(
                  new vector.Vector3(_zoom, _zoom, _zoom)),
              alignment: FractionalOffset.center,
              child: new Image.asset(img),
            ),
          ) ,
        ),

        onDraggableCanceled: (velocity,
            offset) { //When you stop moving the image, it is necessary to setState the new coordinates
          setState(() {
//        _position = offset;
            _position=offset;
          });
        },
        feedback: Container( //Response when moving the image. Increase the width and height to 100.0 to see the difference
          width: 1.0,
          height: 1.0,
          child: new Image.asset(img),
        ),
      ),
    );
  }


  void addImg(img) {
   setState(() {
     _widgets.add(_getWidget(img));
   });

   /* setState(() {
      _img=img;
      AnimModel animModel=AnimModel();
      animModel.position=Offset(0.2, 0.4);
          animModel.widget=   Positioned(
      left :animModel.position.dx,//horizontal
      top: animModel.position.dy,
      child:Draggable( //drag and drop
    child: new Container(
      padding: const EdgeInsets.all(10.0),
      width: 350.0,
      height: 450.0,
      child:  GestureDetector( //zoom
        onScaleStart: _handleScaleStart,
        onScaleUpdate: _handleScaleUpdate,
        child: new Transform(
          transform: new Matrix4.diagonal3(
              new vector.Vector3(_zoom, _zoom, _zoom)),
          alignment: FractionalOffset.center,
          child: new Image.asset(_img),
        ),
      ) ,
    ),
    onDraggableCanceled: (velocity,
        offset) { //When you stop moving the image, it is necessary to setState the new coordinates
      setState(() {
//        _position = offset;
      animModel.position=offset;
      });
    },
    feedback: Container( //Response when moving the image. Increase the width and height to 100.0 to see the difference
      width: 1.0,
      height: 1.0,
      child: new Image.asset(_img),
    ),
        ),
  );
  _model.add(animModel);*/

      /*_widgets.add(
           Draggable( //drag and drop
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                width: 350.0,
                height: 450.0,
                child:  GestureDetector( //zoom
                  onScaleStart: _handleScaleStart,
                  onScaleUpdate: _handleScaleUpdate,
                  child: new Transform(
                    transform: new Matrix4.diagonal3(
                        new vector.Vector3(_zoom, _zoom, _zoom)),
                    alignment: FractionalOffset.center,
                    child: new Image.asset(_img),
                  ),
                ) ,
              ),
              onDraggableCanceled: (velocity,
                  offset) { //When you stop moving the image, it is necessary to setState the new coordinates
                setState(() {
                  _position = offset;
                });
              },
              feedback: Container( //Response when moving the image. Increase the width and height to 100.0 to see the difference
                width: 1.0,
                height: 1.0,
                child: new Image.asset(_img),
              ),
            ),
      );


    });
    */
    Navigator.pop(context);
  }




}