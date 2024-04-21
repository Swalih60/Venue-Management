import 'package:flutter/material.dart';
import 'package:venue/components/all_in_one.dart';
import 'package:venue/components/components.dart';

class HomeABlock extends StatelessWidget {
  const HomeABlock({super.key});

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
                    text: 'Einstein Hall',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AllInOneScreen(databaseName: 'Einstein Hall'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'A113 Board Room',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'A113 Board Room'),
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
                    text: 'Conference Room',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Conference Room'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Incubation Center',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Incubation Center'),
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
                    text: 'Counselling Centre',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Counselling Centre'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Computer Centre',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Computer Centre'),
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
                    text: 'Elective Room A309',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Elective Room A309'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Network/Microproc/Proj A402',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Network/Microproc/Proj A402'),
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
                    text: 'Prog/Database A401',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Prog/Database A401'),
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'IQAC A11',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AllInOneScreen(databaseName: 'IQAC A11'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Phy Lab A510',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AllInOneScreen(databaseName: 'Phy Lab A510'),
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
                    text: 'Communication Lab A512',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Communication Lab A512'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Digital Lab A513',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Digital Lab A513'),
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
                    text: 'Electric Circuit Lab A514',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Electric Circuit Lab A514'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Chem/ Envi Engin Lab a502',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Chem/ Envi Engin Lab a502'),
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
                    text: 'Lag Lab/Prog Lab-2 A505',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Lag Lab/Prog Lab-2 A505'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Analog Integrated Lab A506',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Analog Integrated Lab A506'),
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
                    text: 'Project Lab A507',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Project Lab A507'),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  elevatedButton(
                    text: 'Vlsi And Embebbed System Lab A509',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllInOneScreen(
                            databaseName: 'Vlsi And Embebbed System Lab A509'),
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
