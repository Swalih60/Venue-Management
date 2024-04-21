import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class ElectiveRoomA309 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Elective Room A309',
          updationScreen: ElectiveRoomA309UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ElectiveRoomA309SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Elective Room A309')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ElectiveRoomA309UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Counselling Centre',
        searchScreen: ElectiveRoomA309SearchScreen(),
      )),
    );
  }
}
