import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Drawing%20Room%20B405/search_screen.dart';

// ignore: use_key_in_widget_constructors
class DrawingRoomB405UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Drawing Room B405',
        searchScreen: DrawingRoomB405SearchScreen(),
      )),
    );
  }
}
