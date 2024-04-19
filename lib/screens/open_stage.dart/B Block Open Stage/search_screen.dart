import 'package:flutter/material.dart';
import 'package:venue/components/pages/search_page.dart';

// ignore: use_key_in_widget_constructors
class BBlockOpenStageSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'B Block Open Stage')),
    );
  }
}
