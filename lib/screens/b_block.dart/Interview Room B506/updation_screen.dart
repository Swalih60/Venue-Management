import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Interview%20Room%20B506/search_screen.dart';

// ignore: use_key_in_widget_constructors
class InterviewRoomB506UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Elective Room ME B207',
        searchScreen: InterviewRoomB506SearchScreen(),
      )),
    );
  }
}
