import 'package:flutter/material.dart';
import 'package:venue/components/pages/updation_page.dart';
import 'package:venue/screens/b_block.dart/ME%20Measurement%20Lab%20B304%20B305/search_screen.dart';

// ignore: use_key_in_widget_constructors
class MEMeasurementLabB304B305UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'ME Measurement Lab B304 B305',
        searchScreen: MEMeasurementLabB304B305SearchScreen(),
      )),
    );
  }
}
