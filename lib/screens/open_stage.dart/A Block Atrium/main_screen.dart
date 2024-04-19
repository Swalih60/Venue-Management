import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/open_stage.dart/A%20Block%20Atrium/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class ABlockAtrium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'A Block Atrium',
          updationScreen: ABlockAtriumUpdationScreen(),
        ),
      ),
    );
  }
}
