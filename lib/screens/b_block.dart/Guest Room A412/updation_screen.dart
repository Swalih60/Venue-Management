import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room%20A412/search_screen.dart';

// ignore: use_key_in_widget_constructors
class GuestRoomA412UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Guest Room A412',
        searchScreen: GuestRoomA412SearchScreen(),
      )),
    );
  }
}
