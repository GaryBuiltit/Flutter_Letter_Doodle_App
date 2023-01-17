import 'package:flutter/material.dart';
import 'package:letter_doodle/controller/screen_controller.dart';
import 'package:letter_doodle/screens/letter_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>(
      create: (_) => Controller(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LetterScreen(),
      ),
    );
  }
}
