import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class A113BoardRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'A113 Board Room',
          updationScreen: A113BoardRoomUpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class A113BoardRoomSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: ReusableSearchScreen(databaseName: 'A113 Board Room')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class A113BoardRoomUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Conference Room',
        searchScreen: A113BoardRoomSearchScreen(),
      )),
    );
  }
}
