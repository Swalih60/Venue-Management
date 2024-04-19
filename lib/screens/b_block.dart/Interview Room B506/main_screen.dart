import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Interview%20Room%20B506/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class InterviewRoomB506 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Interview Room B506',
          updationScreen: InterviewRoomB506UpdationScreen(),
        ),
      ),
    );
  }
}
