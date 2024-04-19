import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Drawing%20Room%20B306/search_screen.dart';

// ignore: use_key_in_widget_constructors
class DrawingRoomB306UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Drawing Room B306',
        searchScreen: DrawingRoomB306SearchScreen(),
      )),
    );
  }
}
