import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';

class SearchEinstein extends StatelessWidget {
  const SearchEinstein({Key? key, required this.date}) : super(key: key);

  final DateTime date;

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(formatDate(date)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('einstein').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List docs = snapshot.data!.docs;
            List<Widget> widgets = [];
            docs.forEach((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              DateTime documentDate = (data['date'] as Timestamp).toDate();
              if (isSameDate(documentDate, date)) {
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
                    date: formatDate(date),
                    branch: branch,
                    sem: sem,
                    sTime: sTimeList,
                    eTime: eTimeList,
                    event: event,
                    name: name,
                    docId: document.id,
                  ),
                );
              }
            });
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
