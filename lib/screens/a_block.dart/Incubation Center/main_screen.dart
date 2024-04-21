import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class IncubationCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Incubation Center',
          updationScreen: IncubationCenterUpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class IncubationCenterSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Incubation Center')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class IncubationCenterUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Conference Room',
        searchScreen: IncubationCenterSearchScreen(),
      )),
    );
  }
}
