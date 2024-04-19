import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room%20A412/updation_screen.dart';

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
