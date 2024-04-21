import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class ComputerCentre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Computer Centre',
          updationScreen: ComputerCentreUpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ComputerCentreSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: ReusableSearchScreen(databaseName: 'Computer Centre')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ComputerCentreUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Conference Room',
        searchScreen: ComputerCentreSearchScreen(),
      )),
    );
  }
}
