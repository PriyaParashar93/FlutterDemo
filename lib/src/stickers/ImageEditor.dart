import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class ImageEditor extends CustomPainter {

  ImageEditor({
    this.zoom,
    this.offset,
    this.forward,
    this.scaleEnabled,
    this.image,
  });

  final double zoom;
  final Offset offset;
  final bool forward;
  final bool scaleEnabled;
  ui.Image image;


  @override
  void paint(Canvas canvas, Size size) {
    Size imageSize = new Size(image.width.toDouble(), image.height.toDouble());
    Size targetSize = imageSize * zoom;

    paintImage(
      canvas: canvas,
      rect: (size.center(Offset.zero) * zoom + offset) & targetSize,
      image: image,
      fit: BoxFit.fill,
    );
  }


  @override
  bool shouldRepaint(ImageEditor oldPainter) {
    return oldPainter.zoom != zoom
        || oldPainter.offset != offset
        || oldPainter.forward != forward
        || oldPainter.scaleEnabled != scaleEnabled;

  }

}