import 'package:flutter/material.dart';
import 'package:venue/components/pages/search_page.dart';

// ignore: use_key_in_widget_constructors
class InterviewRoomB506SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(databaseName: 'Interview Room B506')),
    );
  }
}
