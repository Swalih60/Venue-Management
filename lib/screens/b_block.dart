import 'package:flutter/material.dart';
import 'package:venue/components/all_in_one.dart';
import 'package:venue/components/components.dart';

class HomeBBlock extends StatelessWidget {
  const HomeBBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("VENUE'S", style: TextStyle(fontWeight: FontWeight.bold),),
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
                    text: 'Elective Room ME B207',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Elective Room ME B207'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Drawing Room B306',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Drawing Room B306'),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'ME Measurement Lab B304/B305',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'ME Measurement Lab B304/B305'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Drawing Room B405',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Drawing Room B405'),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'Interview Room B506',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Interview Room B506'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Power Electronics Lab B509',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Power Electronics Lab B509'),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'P n T Cell Office B505',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'P n T Cell Office B505'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Guest Room1 B502',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Guest Room1 B502'),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'Guest Room2 B503',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Guest Room2 B503'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Guest Room A412',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Guest Room A412'),
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
