import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:letter_doodle/models/drawing.dart';

class LetterPainter extends CustomPainter {
  LetterPainter({
    this.drawings,
    this.selectedColor,
    this.strokeWitdh,
  });

  List<Drawing> drawings;
  Color selectedColor;
  double strokeWitdh;

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.transparent;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    for (int x = 0; x < drawings.length - 1; x++) {
      if (drawings[x] != null && drawings[x + 1] != null) {
        canvas.drawLine(
            drawings[x].offset, drawings[x + 1].offset, drawings[x].paint);
      } else if (drawings[x] != null && drawings[x + 1] == null) {
        canvas.drawPoints(
            PointMode.points, [drawings[x].offset], drawings[x].paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();
    return true;
  }
}
