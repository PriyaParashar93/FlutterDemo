import 'dart:ui' as ui;

import 'dart:ui';


class AnimationModel{
  ui.Image _image;
  Offset _startingFocalPoint;

  Offset _previousOffset;
  Offset _offset;

  double _previousZoom;
   double _zoom ;
   bool _forward ;
  bool _scaleEnabled;


  AnimationModel(this._image, this._startingFocalPoint, this._previousOffset,
      this._offset, this._previousZoom, this._zoom, this._forward,
      this._scaleEnabled);

  ui.Image get image => _image;

  set image(ui.Image value) {
   _image = value;
  }

  Offset get startingFocalPoint => _startingFocalPoint;

  set startingFocalPoint(Offset value) {
   _startingFocalPoint = value;
  }

  Offset get previousOffset => _previousOffset;

  set previousOffset(Offset value) {
   _previousOffset = value;
  }

  bool get scaleEnabled => _scaleEnabled;

  set scaleEnabled(bool value) {
   _scaleEnabled = value;
  }

  bool get forward => _forward;

  set forward(bool value) {
   _forward = value;
  }

  double get zoom => _zoom;

  set zoom(double value) {
   _zoom = value;
  }

  double get previousZoom => _previousZoom;

  set previousZoom(double value) {
   _previousZoom = value;
  }

  Offset get offset => _offset;

  set offset(Offset value) {
   _offset = value;
  }


}