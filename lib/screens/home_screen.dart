import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/screens/a_block.dart/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.deepPurple[100],
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                height: 200,
                width: 200,
                child: Center(child: Text('')),
              ),
              const SizedBox(
                height: 100,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("S E T T T I N G S"),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("A B O U T  U S"),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.question_mark),
                title: const Text("H E L P"),
                onTap: () {},
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sign Out"),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              )
            ],
          )),
      appBar: AppBar(
        title: const Text("Block's"),
        centerTitle: true,
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
              onPressed: () {},
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
              onPressed: () {},
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
