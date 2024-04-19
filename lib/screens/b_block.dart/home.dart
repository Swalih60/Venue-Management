import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';
import 'package:venue/screens/b_block.dart/Drawing%20Room%20B306/main_screen.dart';
import 'package:venue/screens/b_block.dart/Drawing%20Room%20B405/main_screen.dart';
import 'package:venue/screens/b_block.dart/Elective%20Room%20ME%20B207/main_screen.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room%20A412/main_screen.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room1%20B502/main_screen.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room2%20B503/main_screen.dart';
import 'package:venue/screens/b_block.dart/Interview%20Room%20B506/main_screen.dart';
import 'package:venue/screens/b_block.dart/ME%20Measurement%20Lab%20B304%20B305/main_screen.dart';
import 'package:venue/screens/b_block.dart/P%20n%20T%20Cell%20Office%20B505/main_screen.dart';
import 'package:venue/screens/b_block.dart/Power%20Electronics%20Lab%20B509/main_screen.dart';

class HomeBBlock extends StatelessWidget {
  const HomeBBlock({super.key});

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
                        builder: (context) => ElectiveRoomMEB207(),
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
                        builder: (context) => DrawingRoomB306(),
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
                        builder: (context) => MEMeasurementLabB304B305(),
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
                        builder: (context) => DrawingRoomB405(),
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
                        builder: (context) => InterviewRoomB506(),
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
                        builder: (context) => PowerElectronicsLabB509(),
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
                        builder: (context) => PnTCellOfficeB505(),
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
                        builder: (context) => GuestRoom1B502(),
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
                        builder: (context) => GuestRoom2B503(),
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
                        builder: (context) => GuestRoomA412(),
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
