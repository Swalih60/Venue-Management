import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/open_stage.dart/A%20Block%20Atrium/search_screen.dart';

// ignore: use_key_in_widget_constructors
class ABlockAtriumUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'A Block Atrium',
        searchScreen: ABlockAtriumSearchScreen(),
      )),
    );
  }
}
