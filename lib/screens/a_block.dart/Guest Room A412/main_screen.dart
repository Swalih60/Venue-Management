import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class GuestRoomA412 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Guest Room A412',
          updationScreen: GuestRoomA412UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class GuestRoomA412SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: ReusableSearchScreen(databaseName: 'Guest Room A412')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class GuestRoomA412UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Guest Room A412',
        searchScreen: GuestRoomA412SearchScreen(),
      )),
    );
  }
}
