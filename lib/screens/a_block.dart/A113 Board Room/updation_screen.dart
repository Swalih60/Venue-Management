import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/a_block.dart/A113%20Board%20Room/search_screen.dart';

// ignore: use_key_in_widget_constructors
class A113BoardRoomUpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'A113 Board Room',
        searchScreen: A113BoardRoomSearchScreen(),
      )),
    );
  }
}
