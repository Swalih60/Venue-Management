// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';

class AllInOneScreen extends StatefulWidget {
  const AllInOneScreen({
    Key? key,
    required this.databaseName,
  }) : super(key: key);

  final String databaseName;

  @override
  // ignore: library_private_types_in_public_api
  _AllInOneScreenState createState() => _AllInOneScreenState();
}

class _AllInOneScreenState extends State<AllInOneScreen> {
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
          .collection(widget.databaseName)
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

    await FirebaseFirestore.instance.collection(widget.databaseName).add({
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
        title: Text(
          widget.databaseName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.blue,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReusableUpdationScreen(
                        databaseName: widget.databaseName),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconText(icon: Icons.event_seat, data: '100'),
                ],
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
                    icon: (Icons.calendar_month),
                    onPressed: () => selectDate(context),
                    data: 'Select a date :',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  elevatedButton1(
                    text: startTime.format(context),
                    icon: (Icons.access_time),
                    onPressed: () => selectTime(context, true),
                    data: 'From :',
                  ),
                  const SizedBox(width: 5),
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

class ReusableSearchScreen extends StatefulWidget {
  const ReusableSearchScreen({
    Key? key,
    required this.databaseName,
  }) : super(key: key);
  final String databaseName;

  @override
  State<ReusableSearchScreen> createState() => _ReusableSearchScreenState();
}

class _ReusableSearchScreenState extends State<ReusableSearchScreen> {
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  late DateTime selectedDate;

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

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(dateTime.toLocal());
    return formattedTime;
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    String? currentUid = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectDate(context);
        },
        child: const Icon(Icons.calendar_month),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(formatDate(selectedDate)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.databaseName)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List docs = snapshot.data!.docs;
            List<Widget> widgets = [];
            for (var document in docs) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              DateTime documentDate = (data['date'] as Timestamp).toDate();
              if (isSameDate(documentDate, selectedDate)) {
                String event = data['event'];
                String name = data['name'];
                DateTime sTime = (data['sTime'] as Timestamp).toDate();
                DateTime eTime = (data['eTime'] as Timestamp).toDate();
                String sem = data['sem'];
                String branch = data['branch'];
                String uid = data['uid'];

                String sTimeList = formatTime(sTime);
                String eTimeList = formatTime(eTime);

                widgets.add(
                  listile(
                    uid: uid,
                    currentUid: currentUid,
                    date: formatDate(selectedDate),
                    branch: branch,
                    sem: sem,
                    sTime: sTimeList,
                    eTime: eTimeList,
                    event: event,
                    name: name,
                    docId: document.id,
                    databaseName: widget.databaseName,
                  ),
                );
              }
            }
            if (widgets.isNotEmpty) {
              return ListView(
                children: widgets,
              );
            } else {
              return const Center(child: Text("No Schedules"));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ReusableUpdationScreen extends StatefulWidget {
  const ReusableUpdationScreen({
    Key? key,
    required this.databaseName,
  }) : super(key: key);

  final String databaseName;

  @override
  State<ReusableUpdationScreen> createState() => _ReusableUpdationScreenState();
}

class _ReusableUpdationScreenState extends State<ReusableUpdationScreen> {
  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  late DateTime selectedDate;

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    String formattedDate = formatter.format(date);

    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('h:mm a');

    String formattedTime = formatter.format(dateTime.toLocal());

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    String? currentUid = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Schedules"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ReusableSearchScreen(databaseName: widget.databaseName),
                ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.databaseName)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = docs[index];
                String docId = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String event = data['event'];
                String name = data['name'];
                DateTime date = (data['date'] as Timestamp).toDate();
                DateTime sTime = (data['sTime'] as Timestamp).toDate();
                DateTime eTime = (data['eTime'] as Timestamp).toDate();
                String sem = data['sem'];
                String branch = data['branch'];
                String uid = data['uid'];

                String dateList = formatDate(date);
                String sTimeList = formatTime(sTime);
                String eTimeList = formatTime(eTime);

                return listile(
                  uid: uid,
                  currentUid: currentUid,
                  date: dateList,
                  branch: branch,
                  sem: sem,
                  sTime: sTimeList,
                  eTime: eTimeList,
                  event: event,
                  name: name,
                  docId: docId,
                  databaseName: widget.databaseName,
                );
              },
            );
          }
          return const Center(child: Text("No Schedules"));
        },
      ),
    );
  }
}
