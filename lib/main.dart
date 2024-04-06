import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:venue/auth/auth_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
  deleteOldData();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

Future<void> deleteOldData() async {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('einstein');
  final QuerySnapshot snapshot = await collectionRef.get();
  final currentDate = DateTime.now();

  for (var doc in snapshot.docs) {
    final date = (doc.data() as Map<String, dynamic>)['date'] as Timestamp;
    final docDate = date.toDate();
    if (docDate.isBefore(currentDate)) {
      doc.reference.delete();
    }
  }
}
