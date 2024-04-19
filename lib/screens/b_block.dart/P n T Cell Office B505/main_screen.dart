import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/screens/b_block.dart/P%20n%20T%20Cell%20Office%20B505/updation_screen.dart';

// ignore: use_key_in_widget_constructors
class PnTCellOfficeB505 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'P n T Cell Office B505',
          updationScreen: PnTCellOfficeB505UpdationScreen(),
        ),
      ),
    );
  }
}
