import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/model.dart';

class UpdationEinstein extends StatelessWidget {
  UpdationEinstein({super.key});

  final FireBaseCRUD obj = FireBaseCRUD();

  String formattedTime(String timeString) {
    RegExp regex = RegExp(r'(\d{1,2}):(\d{2})');
    Match match = regex.firstMatch(timeString) as Match;
    int hour = int.parse(match.group(1)!);
    int minute = int.parse(match.group(2)!);
    String period = (hour < 12) ? 'AM' : 'PM';
    hour = (hour == 0 || hour == 12) ? 12 : hour % 12;
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';
  }

  String formattedDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year % 100;
    return ("$day/$month/$year");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: obj.readVenue(),
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
                String date = data['date'].toString();
                String sTime = data['sTime'].toString();
                String eTime = data['eTime'].toString();
                String sem = data['sem'];
                String branch = data['branch'];

                return ListTile(
                    title: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(event),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(name),
                        Text(sem),
                        Text(branch),
                      ],
                    ),
                    leading: Text(date),
                    trailing: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text("From : $sTime"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("To : $eTime"),
                      ],
                    ));
              },
            );
          }
          return const Center(child: Text("No Schedules"));
        },
      ),
    );
  }
}
