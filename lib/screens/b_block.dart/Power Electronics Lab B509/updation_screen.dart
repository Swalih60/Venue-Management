import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Power%20Electronics%20Lab%20B509/search_screen.dart';

// ignore: use_key_in_widget_constructors
class PowerElectronicsLabB509UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Power Electronics Lab B509',
        searchScreen: PowerElectronicsLabB509SearchScreen(),
      )),
    );
  }
}
