import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_appasd/src/animation/AnimationModelClass.dart';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_appasd/src/stickers/ImageEditor.dart';




class SaveImg extends StatefulWidget {
  SaveImg({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SaveImgState createState() => new _SaveImgState();
}

class _SaveImgState extends State<SaveImg> {
  ui.Image image;
  ui.Image image1;
  bool isImageloaded = false;
  Offset _startingFocalPoint;

  Offset _previousOffset;
  Offset _offset = Offset.zero;

  double _previousZoom;
  double _zoom = 1.0;
  bool _forward = true;
  bool _scaleEnabled = true;


  void initState() {
    super.initState();
    init();
  }

  Future <Null> init() async {
    final ByteData data = await rootBundle.load('images/emoge_two.jpg');
    image = await loadImage(new Uint8List.view(data.buffer));

  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }


  void _handleScaleStart(ScaleStartDetails details) {
    setState(() {
      _startingFocalPoint = details.focalPoint;
      _previousOffset = _offset;
      _previousZoom = _zoom;
    });
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _zoom = _previousZoom * details.scale;
      // Ensure that item under the focal point stays in the same place despite zooming
      final Offset normalizedOffset = (_startingFocalPoint - _previousOffset) / _previousZoom;
      _offset = details.focalPoint - normalizedOffset * _zoom;

    });
  }



  Widget _buildImage() {
    if (this.isImageloaded) {
      return Stack(
        fit: StackFit.expand,

        children: <Widget>[

          GestureDetector(
            onScaleStart: _scaleEnabled ? _handleScaleStart : null,
            onScaleUpdate: _scaleEnabled ? _handleScaleUpdate : null,
            child:  CustomPaint(
              painter: new ImageEditor(image: image,
                zoom: _zoom,
                offset: _offset,
                forward: _forward,
                scaleEnabled: _scaleEnabled,),
            ),
          ),




          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.purple),
              child: Text("Drag or Zoom image using Canvas",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      );
    } else {
      return new Center(child: new Text('loading',style: TextStyle(color: Colors.white),));
    }
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: _buildImage(),

    );
  }
}



