import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:venue/pages/einstein/home.dart';
import 'package:venue/pages/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/einstein': (context) => const HomeEinstein(),
      },
    );
  }
}
