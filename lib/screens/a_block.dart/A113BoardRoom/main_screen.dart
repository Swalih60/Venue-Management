import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/a_block.dart/A113BoardRoom/updation_screen.dart';

class A113BoardRoomScreen extends StatelessWidget {
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
