import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room2%20B503/search_screen.dart';

// ignore: use_key_in_widget_constructors
class GuestRoom2B503UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Guest Room2 B503',
        searchScreen: GuestRoom2B503SearchScreen(),
      )),
    );
  }
}
