import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:venue/auth/auth_screen.dart';

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
      home: const AuthScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple[200]),
      ),
    );
  }
}

List<String> databaseNames = [
  'Einstein Hall',
];

Future<void> deleteOldData(List<String> databaseNames) async {
  final currentDate = DateTime.now();

  for (var dbName in databaseNames) {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(dbName);
    final QuerySnapshot snapshot = await collectionRef.get();

    for (var doc in snapshot.docs) {
      final date = (doc.data() as Map<String, dynamic>)['date'] as Timestamp;
      final docDate = date.toDate();

      if (docDate.year < currentDate.year ||
          (docDate.year == currentDate.year &&
              docDate.month < currentDate.month) ||
          (docDate.year == currentDate.year &&
              docDate.month == currentDate.month &&
              docDate.day < currentDate.day)) {
        await doc.reference.delete();
      }
    }
  }
}
