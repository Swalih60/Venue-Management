import 'package:flutter/material.dart';
import 'package:venue/components/all_in_one.dart';
import 'package:venue/components/components.dart';

class OpenStage extends StatelessWidget {
  const OpenStage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "VENUE'S",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'A Block Atrium',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'A Block Atrium'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'B Block Open Stage',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'B Block Open Stage'),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
