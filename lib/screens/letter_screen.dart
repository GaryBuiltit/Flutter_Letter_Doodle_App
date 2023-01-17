import 'package:flutter/material.dart';
import 'package:letter_doodle/components/alphabet_list.dart';
import 'package:letter_doodle/controller/screen_controller.dart';
import 'package:letter_doodle/models/drawing.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:letter_doodle/utilities/painter.dart';

class LetterScreen extends StatefulWidget {
  @override
  _LetterScreenState createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  // Function to show dialog to change color
  changeColor() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: context.watch<Controller>().selectedColor,
                onColorChanged: (color) {
                  context.read<Controller>().updateColor(color);
                },
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHieght = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var letterChoice = context.watch<Controller>().currentLetter;
    var controller = Provider.of<Controller>(context);
    return SafeArea(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 97, 255, 1),
                  Color.fromRGBO(96, 239, 255, 1)
                ]),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: AlphabetList(),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: screenHieght * .70,
              width: screenWidth * .90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage('images/$letterChoice.png'),
                    fit: BoxFit.fill),
              ),
              child: GestureDetector(
                onPanStart: (details) {
                  controller.addDrawing(Drawing(
                      offset: details.localPosition,
                      paint: Paint()
                        ..color = controller.selectedColor
                        ..isAntiAlias = true
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = controller.strokeWidth));
                },
                onPanUpdate: (details) {
                  controller.addDrawing(Drawing(
                      offset: details.localPosition,
                      paint: Paint()
                        ..color = controller.selectedColor
                        ..isAntiAlias = true
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = controller.strokeWidth));
                },
                onPanEnd: (details) {
                  controller.addDrawing(null);
                },
                child: CustomPaint(
                  painter: LetterPainter(
                      drawings: controller.drawings,
                      selectedColor: controller.selectedColor,
                      strokeWitdh: controller.strokeWidth),
                ),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Expanded(
              child: Center(
                child: Container(
                  height: screenHieght * .10,
                  width: screenWidth * .90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: changeColor,
                          icon: Icon(
                            Icons.color_lens,
                            color: controller.selectedColor,
                          ),
                        ),
                        Slider(
                            value: controller.strokeWidth,
                            min: 1,
                            max: 10,
                            onChanged: ((value) =>
                                controller.updateStrokeWidth(value))),
                        IconButton(
                          onPressed: () {
                            controller.eraseDrawing();
                          },
                          icon: Icon(Icons.layers_clear),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
