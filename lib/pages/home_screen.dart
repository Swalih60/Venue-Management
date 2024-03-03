import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("VENUE'S"),
      ),
      body: Center(
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
                    Navigator.of(context).pushNamed('/einstein');
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
    );
  }
}
