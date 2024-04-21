import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class LagLabProgLab2A505 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Lag Lab Prog Lab-2 A505',
          updationScreen: LagLabProgLab2A505UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LagLabProgLab2A505SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Lag Lab Prog Lab-2 A505')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LagLabProgLab2A505UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Lag Lab Prog Lab-2 A505',
        searchScreen: LagLabProgLab2A505SearchScreen(),
      )),
    );
  }
}
