import 'package:flutter/material.dart';
import 'package:venue/pages/einstein/home.dart';
import 'package:venue/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/einstein': (context) => const HomeEinstein(),
      },
    );
  }
}
