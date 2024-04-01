import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';
import 'package:venue/screens/einstein/einstein.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("VENUE'S"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Einstein Hall',
                    icon: Icons.house,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EinsteinHall(),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Seminar Hall',
                    icon: Icons.house,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
