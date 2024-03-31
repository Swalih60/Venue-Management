import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';
import 'package:venue/models/model.dart';

class EinsteinHall extends StatefulWidget {
  const EinsteinHall({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EinsteinHallState createState() => _EinsteinHallState();
}

class _EinsteinHallState extends State<EinsteinHall> {
  String branch = 'CSE';
  String sem = 'S1';
  final name = TextEditingController();
  final event = TextEditingController();
  FireBaseCRUD fs = FireBaseCRUD();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  Future<void> _scheduleVenue() async {
    final selectedStartTime = DateTime(_selectedDate.year, _selectedDate.month,
        _selectedDate.day, _startTime.hour, _startTime.minute);
    final selectedEndTime = DateTime(_selectedDate.year, _selectedDate.month,
        _selectedDate.day, _endTime.hour, _endTime.minute);

    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('venues')
        .where('date', isEqualTo: Timestamp.fromDate(_selectedDate))
        .get();

    for (final doc in querySnapshot.docs) {
      final start = (doc['sTime'] as Timestamp).toDate();
      final end = (doc['eTime'] as Timestamp).toDate();

      if ((selectedStartTime.isAfter(start) &&
              selectedStartTime.isBefore(end)) ||
          (selectedEndTime.isAfter(start) && selectedEndTime.isBefore(end)) ||
          (selectedStartTime.isBefore(start) && selectedEndTime.isAfter(end)) ||
          (selectedStartTime == start && selectedEndTime == end)) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.red[200],
              title: const Text('Booking Failed'),
              content: const Text('Venue already booked for this time period'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
    }

    await FirebaseFirestore.instance.collection('venues').add({
      'name': name.text,
      'event': event.text,
      'sem': sem,
      'branch': branch,
      'date': Timestamp.fromDate(_selectedDate),
      'sTime': selectedStartTime,
      'eTime': selectedEndTime,
    });
    name.clear();
    event.clear();

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green[200],
          title: const Text('Booking Successful'),
          content: const Text('Venue booked successfully'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              textfield(text: 'Name', controller: name),
              const SizedBox(height: 10),
              textfield(text: 'Event', controller: event),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: branch,
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
                      branch = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: sem,
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
                      sem = newValue!;
                    });
                  },
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton1(
                    text: "${_selectedDate.toLocal()}".split(' ')[0],
                    icon: (Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                    data: 'Select a date :',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton1(
                    text: _startTime.format(context),
                    icon: (Icons.access_time),
                    onPressed: () => _selectTime(context, true),
                    data: 'From :',
                  ),
                  const SizedBox(width: 30),
                  elevatedButton1(
                    text: _endTime.format(context),
                    icon: Icons.access_time,
                    onPressed: () => _selectTime(context, false),
                    data: 'To :',
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: _scheduleVenue,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 25),
                    child: Text(
                      'SCHEDULE',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
