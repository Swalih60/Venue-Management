import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Elective%20Room%20ME%20B207/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class ElectiveRoomMEB207 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Elective Room ME B207',
          updationScreen: ElectiveRoomMEB207UpdationScreen(),
        ),
      ),
    );
  }
}
