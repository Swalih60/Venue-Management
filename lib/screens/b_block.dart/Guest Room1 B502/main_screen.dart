import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room1%20B502/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class GuestRoom1B502 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Guest Room1 B502',
          updationScreen: GuestRoom1B502UpdationScreen(),
        ),
      ),
    );
  }
}
