import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';
import 'package:venue/models/model.dart';

class EinsteinHall extends StatefulWidget {
  const EinsteinHall({super.key});

  @override
  State<EinsteinHall> createState() => _EinsteinHallState();
}

class _EinsteinHallState extends State<EinsteinHall> {
  FireBaseCRUD obj = FireBaseCRUD();
  List<DateTime> selectedDates = [];
  void fetchSelectedDates() async {
    List<DateTime> datesFromFirestore = await obj.fetchDate();
    setState(() {
      selectedDates = datesFromFirestore;
    });
  }

  String selectedItem1 = 'CSE';
  String selectedItem = 'S1';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime1 = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();

  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSelectedDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textfield(text: 'Name', controller: text1),
              const SizedBox(
                height: 30,
              ),
              textfield(text: 'Event Name', controller: text2),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: selectedItem1,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'CSE',
                      child: Text("CSE"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'EC',
                      child: Text("EC"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'CIVIL',
                      child: Text("CIVIL"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'MECH',
                      child: Text("MECH"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'EEE',
                      child: Text("EEE"),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem1 = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: selectedItem,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'S1',
                      child: Text("S1"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S2',
                      child: Text("S2"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S3',
                      child: Text("S3"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S4',
                      child: Text("S4"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S5',
                      child: Text("S5"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S6',
                      child: Text("S6"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S7',
                      child: Text("S7"),
                    ),
                    DropdownMenuItem<String>(
                      value: 'S8',
                      child: Text("S8"),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 140,
                child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                        selectableDayPredicate: (date) {
                          return !selectedDates.contains(date);
                        },
                      ).then((value) {
                        setState(() {
                          selectedDate = value!;
                        });
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          DateFormat.MMMd().format(selectedDate),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.calendar_month)
                      ],
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 145,
                    child: ElevatedButton(
                        onPressed: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            setState(() {
                              selectedTime1 = value!;
                            });
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("From:"),
                            Row(
                              children: [
                                Text(
                                  '${selectedTime1.hourOfPeriod}:${selectedTime1.minute} ${selectedTime1.period == DayPeriod.am ? 'AM' : 'PM'}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.access_time)
                              ],
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: 60,
                    width: 145,
                    child: ElevatedButton(
                        onPressed: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            setState(() {
                              selectedTime2 = value!;
                            });
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("To:"),
                            Row(
                              children: [
                                Text(
                                  '${selectedTime2.hourOfPeriod}:${selectedTime2.minute} ${selectedTime2.period == DayPeriod.am ? 'AM' : 'PM'}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.access_time)
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 80,
                width: 260,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    onPressed: () {
                      obj.addVenue(
                          text2.text,
                          text1.text,
                          selectedTime1.toString(),
                          selectedTime2.toString(),
                          selectedDate.toString(),
                          selectedItem1,
                          selectedItem);
                    },
                    child: const Text(
                      "Schedule",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
