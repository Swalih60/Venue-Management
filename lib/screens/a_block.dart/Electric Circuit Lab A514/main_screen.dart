import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class ElectricCircuitLabA514 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Electric Circuit Lab A514',
          updationScreen: ElectricCircuitLabA514UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ElectricCircuitLabA514SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child:
              ReusableSearchScreen(databaseName: 'Electric Circuit Lab A514')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ElectricCircuitLabA514UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Electric Circuit Lab A514',
        searchScreen: ElectricCircuitLabA514SearchScreen(),
      )),
    );
  }
}
