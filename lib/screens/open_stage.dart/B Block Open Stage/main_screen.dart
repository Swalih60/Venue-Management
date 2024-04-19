import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/open_stage.dart/B%20Block%20Open%20Stage/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class BBlockOpenStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'B Block Open Stage',
          updationScreen: BBlockOpenStageUpdationScreen(),
        ),
      ),
    );
  }
}
