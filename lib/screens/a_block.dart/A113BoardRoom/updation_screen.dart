import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/a_block.dart/A113BoardRoom/schedule_screen.dart';

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
