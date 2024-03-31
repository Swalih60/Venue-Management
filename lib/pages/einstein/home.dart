import 'package:flutter/material.dart';
import 'package:venue/pages/einstein/einstein.dart';
import 'package:venue/pages/einstein/updation.dart';

class HomeEinstein extends StatefulWidget {
  const HomeEinstein({super.key});

  @override
  State<HomeEinstein> createState() => _HomeEinsteinState();
}

class _HomeEinsteinState extends State<HomeEinstein> {
  int selectedIndex = 0;

  final List pages = [const EinsteinHall(), UpdationEinstein()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Einstein Hall"),
        centerTitle: true,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Schedules'),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
