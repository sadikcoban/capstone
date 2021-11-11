import 'package:flutter/material.dart';
import 'package:park_application/Intro/IntroMainPage.dart';

void main() {
  runApp(
    MaterialApp(
        home: MainClass(),
      ),
  );
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroMainPage();
  }
}
