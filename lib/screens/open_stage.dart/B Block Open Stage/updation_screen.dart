import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/open_stage.dart/B%20Block%20Open%20Stage/search_screen.dart';

// ignore: use_key_in_widget_constructors
class BBlockOpenStageUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'B Block Open Stage',
        searchScreen: BBlockOpenStageSearchScreen(),
      )),
    );
  }
}
