import 'package:flutter/material.dart';
import 'package:letter_doodle/models/drawing.dart';

class Controller with ChangeNotifier {
  var currentLetter = 'A';
  final List<Drawing> drawings = [];
  Color selectedColor = Colors.red;
  double strokeWidth = 4.0;

  updateColor(newColor) {
    selectedColor = newColor;
    notifyListeners();
  }

  updateStrokeWidth(newWidth) {
    strokeWidth = newWidth;
    notifyListeners();
  }

  addDrawing(newDrawing) {
    drawings.add(newDrawing);
    notifyListeners();
  }

  updateLetter(newLetter) {
    currentLetter = newLetter;
    notifyListeners();
  }

  eraseDrawing() {
    drawings.clear();
    notifyListeners();
  }
}
