import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_appasd/src/animation/AnimationModelClass.dart';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_appasd/src/stickers/ImageEditor.dart';

class StickerAnim extends StatefulWidget {
  StickerAnim({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StickerAnimState createState() => new _StickerAnimState();
}

class _StickerAnimState extends State<StickerAnim> {
  ui.Image image;
  ui.Image image0;
  bool isImageloaded = false;
  Offset _startingFocalPoint;

  Offset _previousOffset;
  Offset _offset = Offset.zero;

  double _previousZoom;
  double _zoom = 1.0;
  bool _forward = true;
  bool _scaleEnabled = true;

  List<AnimationModel> model = List<AnimationModel>();
  int _pos = 1;

  void initState() {
    super.initState();
    init();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('images/emoge_two.jpg');
    final ByteData data0 = await rootBundle.load('images/emoge_one.png');
    image = await loadImage(new Uint8List.view(data.buffer));
    image0 = await loadImage(new Uint8List.view(data0.buffer));

    model.add(AnimationModel(image, _startingFocalPoint, _previousOffset,
        _offset, _previousZoom, _zoom, _forward, _scaleEnabled));

    model.add(AnimationModel(image0, _startingFocalPoint, _previousOffset,
        _offset, _previousZoom, _zoom, _forward, _scaleEnabled));
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

  void _handleScaleStart(ScaleStartDetails details, int pos) {
    setState(() {

      model[pos].startingFocalPoint = details.focalPoint;
      model[pos].previousOffset = model[pos].offset;
      model[pos].previousZoom = model[pos].zoom;
    });
  }

  void _handleScaleUpdate(ScaleUpdateDetails details, int pos) {
    setState(() {
      model[pos].zoom = model[pos].previousZoom * details.scale;
      final Offset normalizedOffset =
          (model[pos].startingFocalPoint - model[pos].previousOffset) /
              model[pos].previousZoom;
      model[pos].offset =
          details.focalPoint - normalizedOffset * model[pos].zoom;

    });
  }

  Widget _buildImage() {
    if (this.isImageloaded) {

      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap:_pos==1?null: ()=> setState(() {
                _pos = 0;
                print('top tapped!');

            }),
            onLongPress: _pos==0?()
            {setState(() {
               if(_pos==0)
                 _pos=1;
             });
            }:null,
            onScaleStart: _pos==1 ? null : (detail)=> _handleScaleStart(detail,0),
            onScaleUpdate: _pos==1  ? null : (detail) => _handleScaleUpdate(detail, 0),
            child: CustomPaint(
              painter: new ImageEditor(
                image: image0,
                zoom: model[0].zoom,
                offset: model[0].offset,
                forward: model[0].forward,
                scaleEnabled: model[0].scaleEnabled,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap:_pos==0 ? null: ()=>setState(() {
                _pos = 1;
                print('bottom tapped!');

              }),
            onLongPress:_pos==1?()
            {
              setState(() {
                if(_pos==1)
                  _pos=0;


              });
            }:null,
            onScaleStart: _pos==1 ?  (detail)=> _handleScaleStart(detail,1) : null,
            onScaleUpdate: _pos==1 ? (detail) => _handleScaleUpdate(detail, 1) : null,
            child: CustomPaint(
              painter: new ImageEditor(
                image: image,
                zoom: model[1].zoom,
                offset:  model[1].offset,
                forward: model[1].forward,
                scaleEnabled:  model[1].scaleEnabled,
              ),
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
              child: Text(
                "Drag or Zoom image using Canvas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 06,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      );
    } else {
      return new Center(
          child: new Text(
        'loading',
        style: TextStyle(color: Colors.white),
      ));
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

  handleScaleStart(onScaleStart, int i) {}
}
