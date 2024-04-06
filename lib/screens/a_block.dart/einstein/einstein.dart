import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/components/components.dart';
import 'package:venue/screens/a_block.dart/einstein/updation.dart';

class EinsteinHall extends StatefulWidget {
  const EinsteinHall({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EinsteinHallState createState() => _EinsteinHallState();
}

class _EinsteinHallState extends State<EinsteinHall> {
  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now().subtract(const Duration(days: 1));

    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();

    branch = 'CSE';
    sem = 'S1';

    loadExistingBookings();
  }

  Future<QuerySnapshot<Object?>> loadExistingBookings() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('einstein')
          .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
          .get();

      return querySnapshot;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load existing bookings');
    }
  }

  String? uid = FirebaseAuth.instance.currentUser?.uid;
  String branch = 'CSE';
  String sem = 'S1';
  final name = TextEditingController();
  final event = TextEditingController();

  String text =
      "Einstein Hall in A Block offers a convenient and functional space for academic activities. With easy accessibility for students and faculty, it accommodates lectures, workshops, and discussions. The hall's 100-seat capacity and air conditioning ensure comfort during academic endeavors.";

  late DateTime selectedDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  Future<void> scheduleVenue(ctx) async {
    final selectedStartTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, startTime.hour, startTime.minute);
    final selectedEndTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, endTime.hour, endTime.minute);

    try {
      final QuerySnapshot querySnapshot = await loadExistingBookings();

      log("calleddd!!!!!!!!!!!!!!!");
      log(querySnapshot.docs.toString());

      for (final doc in querySnapshot.docs) {
        final start = (doc['sTime'] as Timestamp).toDate();
        final end = (doc['eTime'] as Timestamp).toDate();

        if ((selectedStartTime.isAfter(start) &&
                selectedStartTime.isBefore(end)) ||
            (selectedEndTime.isAfter(start) && selectedEndTime.isBefore(end)) ||
            (selectedStartTime.isBefore(start) &&
                selectedEndTime.isAfter(end)) ||
            (selectedStartTime == start && selectedEndTime == end)) {
          showDialog(
            context: ctx,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.red[200],
                title: const Text('Booking Failed'),
                content:
                    const Text('Venue already booked for this time period'),
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
    } catch (e) {
      log(e.toString());
    }

    await FirebaseFirestore.instance.collection('einstein').add({
      'uid': uid,
      'name': name.text,
      'event': event.text,
      'sem': sem,
      'branch': branch,
      'date': Timestamp.fromDate(selectedDate),
      'sTime': selectedStartTime,
      'eTime': selectedEndTime,
      'TimeStamp': Timestamp.now(),
    });
    name.clear();
    event.clear();

    showDialog(
      context: ctx,
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Einstein Hall"),
        shadowColor: Colors.blue,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UpdationEinstein(),
                  ));
                },
                icon: const Icon(Icons.update),
                iconSize: 30,
              ),
              const SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  wordSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.blue,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              textfield(text: 'Name', controller: name),
              const SizedBox(height: 10),
              textfield(text: 'Event', controller: event),
              const SizedBox(height: 20),
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
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton1(
                    text: "${selectedDate.toLocal()}".split(' ')[0],
                    icon: (Icons.calendar_today),
                    onPressed: () => selectDate(context),
                    data: 'Select a date :',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButton1(
                    text: startTime.format(context),
                    icon: (Icons.access_time),
                    onPressed: () => selectTime(context, true),
                    data: 'From :',
                  ),
                  const SizedBox(width: 20),
                  elevatedButton1(
                    text: endTime.format(context),
                    icon: Icons.access_time,
                    onPressed: () => selectTime(context, false),
                    data: 'To :',
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                ),
                onPressed: () => scheduleVenue(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 25),
                  child: Text(
                    'SCHEDULE',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Please check existing schedules before booking",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}