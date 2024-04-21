import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class CommunicationLabA512 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Communication Lab A512',
          updationScreen: CommunicationLabA512UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CommunicationLabA512SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Communication Lab A512')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CommunicationLabA512UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Communication Lab A512',
        searchScreen: CommunicationLabA512SearchScreen(),
      )),
    );
  }
}
