import 'package:flutter/material.dart';
import 'package:venue/components/pages/search_page.dart';

class A113BoardRoomSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: ReusableSearchScreen(databaseName: 'A113 Board Room')),
    );
  }
}
