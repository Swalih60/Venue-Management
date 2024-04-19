import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room1%20B502/search_screen.dart';

// ignore: use_key_in_widget_constructors
class GuestRoom1B502UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Guest Room1 B502',
        searchScreen: GuestRoom1B502SearchScreen(),
      )),
    );
  }
}
