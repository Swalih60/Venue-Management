import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';

import 'einstein/einstein.dart';

class HomeABlock extends StatelessWidget {
  const HomeABlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("VENUE'S"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
