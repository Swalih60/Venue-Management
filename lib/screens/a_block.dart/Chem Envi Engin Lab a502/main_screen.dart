import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class ChemEnviEnginLaba502 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Chem Envi Engin Lab a502',
          updationScreen: ChemEnviEnginLaba502UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ChemEnviEnginLaba502SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child:
              ReusableSearchScreen(databaseName: 'Chem Envi Engin Lab a502')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ChemEnviEnginLaba502UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Chem Envi Engin Lab a502',
        searchScreen: ChemEnviEnginLaba502SearchScreen(),
      )),
    );
  }
}
