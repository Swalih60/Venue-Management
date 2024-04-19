import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/a_block.dart/A113%20Board%20Room/updation_screen.dart';

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
