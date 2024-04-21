import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';
import 'package:venue/screens/a_block.dart/A113%20Board%20Room/main_screen.dart';
import 'package:venue/screens/a_block.dart/Analog%20Integrated%20Lab%20A506/main_screen.dart';
import 'package:venue/screens/a_block.dart/Chem%20Envi%20Engin%20Lab%20a502/main_screen.dart';
import 'package:venue/screens/a_block.dart/Communication%20Lab%20A512/main_screen.dart';
import 'package:venue/screens/a_block.dart/Computer%20Centre/main_screen.dart';
import 'package:venue/screens/a_block.dart/Conference%20Room/main_screen.dart';
import 'package:venue/screens/a_block.dart/Counselling%20Centre/main_screen.dart';
import 'package:venue/screens/a_block.dart/Digital%20Lab%20A513/main_screen.dart';
import 'package:venue/screens/a_block.dart/Elective%20Room%20A309/main_screen.dart';
import 'package:venue/screens/a_block.dart/Electric%20Circuit%20Lab%20A514/main_screen.dart';
import 'package:venue/screens/a_block.dart/IQAC%20A11/main_screen.dart';
import 'package:venue/screens/a_block.dart/Incubation%20Center/main_screen.dart';
import 'package:venue/screens/a_block.dart/Lag%20Lab%20Prog%20Lab2%20A505/main_screen.dart';
import 'package:venue/screens/a_block.dart/Network%20Microproc%20Proj%20A402/main_screen.dart';
import 'package:venue/screens/a_block.dart/Phy%20Lab%20A510/main_screen.dart';
import 'package:venue/screens/a_block.dart/Prog%20Database%20A401/main_screen.dart';
import 'package:venue/screens/a_block.dart/Project%20Lab%20A507/main_screen.dart';
import 'package:venue/screens/a_block.dart/Vlsi%20And%20Embebbed%20System%20Lab%20A509/main_screen.dart';
import 'package:venue/screens/b_block.dart/Guest%20Room%20A412/main_screen.dart';

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
                        builder: (context) => const EinsteinHall(),
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
                        builder: (context) => A113BoardRoom(),
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
                        builder: (context) => ConferenceRoom(),
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
                        builder: (context) => IncubationCenter(),
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
                        builder: (context) => CounsellingCentre(),
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
                        builder: (context) => ComputerCentre(),
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
                        builder: (context) => ElectiveRoomA309(),
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
                        builder: (context) => NetworkMicroprocProjA402(),
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
                        builder: (context) => ProgDatabaseA401(),
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton(
                    text: 'IQAC A11',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IQACA11(),
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
                        builder: (context) => PhyLabA510(),
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
                        builder: (context) => CommunicationLabA512(),
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
                        builder: (context) => DigitalLabA513(),
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
                        builder: (context) => ElectricCircuitLabA514(),
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
                        builder: (context) => ChemEnviEnginLaba502(),
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
                        builder: (context) => LagLabProgLab2A505(),
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
                        builder: (context) => AnalogIntegratedLabA506(),
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
                        builder: (context) => ProjectLabA507(),
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
                        builder: (context) => VlsiAndEmbebbedSystemLabA509(),
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
