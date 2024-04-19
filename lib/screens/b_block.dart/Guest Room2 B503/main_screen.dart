import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room2%20B503/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class GuestRoom2B503 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Guest Room2 B503',
          updationScreen: GuestRoom2B503UpdationScreen(),
        ),
      ),
    );
  }
}
