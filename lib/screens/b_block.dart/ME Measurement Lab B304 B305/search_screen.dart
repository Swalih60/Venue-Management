import 'package:flutter/material.dart';
import 'package:venue/components/pages/search_page.dart';

// ignore: use_key_in_widget_constructors
class MEMeasurementLabB304B305SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(
              databaseName: 'ME Measurement Lab B304 B305')),
    );
  }
}
