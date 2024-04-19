import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/Power%20Electronics%20Lab%20B509/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class PowerElectronicsLabB509 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Power Electronics Lab B509',
          updationScreen: PowerElectronicsLabB509UpdationScreen(),
        ),
      ),
    );
  }
}
