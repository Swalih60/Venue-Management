import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Drawing%20Room%20B306/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class DrawingRoomB306 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Drawing Room B306',
          updationScreen: DrawingRoomB306UpdationScreen(),
        ),
      ),
    );
  }
}
