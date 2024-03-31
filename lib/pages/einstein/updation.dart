import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';

import '../../models/model.dart';

class UpdationEinstein extends StatelessWidget {
  UpdationEinstein({super.key});

  String formatDate(DateTime date) {
    // Create a DateFormat object for formatting the date
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    // Format the DateTime object into a string with the desired format
    String formattedDate = formatter.format(date);

    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    // Create a DateFormat object for formatting time
    DateFormat formatter =
        DateFormat('h:mm a'); // 'h:mm a' for 12-hour format with AM/PM

    // Format the DateTime object into a string with the desired format
    String formattedTime = formatter.format(dateTime.toLocal());

    return formattedTime;
  }

  final FireBaseCRUD obj = FireBaseCRUD();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('venues')
            .orderBy('TimeStamp')
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

                String dateList = formatDate(date);
                String sTimeList = formatTime(sTime);
                String eTimeList = formatTime(eTime);

                return listile(
                  date: dateList,
                  branch: branch,
                  sem: sem,
                  sTime: sTimeList,
                  eTime: eTimeList,
                  event: event,
                  name: name,
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
