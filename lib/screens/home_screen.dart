import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/screens/a_block.dart';
import 'package:venue/screens/open_stage.dart';

import 'b_block.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Block's",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeABlock(),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "A Block",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeBBlock(),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "B Block",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OpenStage(),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Open Stage",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
