import 'package:flutter/material.dart';
import 'package:letter_doodle/controller/screen_controller.dart';
import 'package:provider/provider.dart';

class AlphabetList extends StatelessWidget {
  List<Widget> alphabetButton(
    context,
  ) {
    List<Widget> alphabetButtons = [];
    for (var letter in alphabet) {
      var buttonText = letter;
      var button = Padding(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () {
            Provider.of<Controller>(context, listen: false)
                .updateLetter(buttonText);
            Provider.of<Controller>(context, listen: false).drawings.clear();
          },
          style: TextButton.styleFrom(
            minimumSize: Size(10, 10),
            elevation: 5,
            backgroundColor: Colors.blue,
            shadowColor: Colors.blue,
          ),
          child: Text(
            '$buttonText',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
      alphabetButtons.add(button);
    }
    return alphabetButtons;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: alphabetButton(context),
      ),
    );
  }
}

const List<String> alphabet = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
