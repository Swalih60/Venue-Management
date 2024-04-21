import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class CounsellingCentre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Counselling Centre',
          updationScreen: CounsellingCentreUpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CounsellingCentreSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Counselling Centre')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CounsellingCentreUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Counselling Centre',
        searchScreen: CounsellingCentreSearchScreen(),
      )),
    );
  }
}