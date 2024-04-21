import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class AnalogIntegratedLabA506 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Analog Integrated Lab A506',
          updationScreen: AnalogIntegratedLabA506UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AnalogIntegratedLabA506SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child:
              ReusableSearchScreen(databaseName: 'Analog Integrated Lab A506')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AnalogIntegratedLabA506UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Analog Integrated Lab A506',
        searchScreen: AnalogIntegratedLabA506SearchScreen(),
      )),
    );
  }
}
