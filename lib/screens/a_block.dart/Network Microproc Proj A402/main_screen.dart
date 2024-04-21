import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class NetworkMicroprocProjA402 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Network Microproc Proj A402',
          updationScreen: NetworkMicroprocProjA402UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class NetworkMicroprocProjA402SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(
              databaseName: 'Network Microproc Proj A402')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class NetworkMicroprocProjA402UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Counselling Centre',
        searchScreen: NetworkMicroprocProjA402SearchScreen(),
      )),
    );
  }
}
