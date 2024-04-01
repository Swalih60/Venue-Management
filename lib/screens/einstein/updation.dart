import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';

class UpdationEinstein extends StatelessWidget {
  const UpdationEinstein({super.key});

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
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('einstein').snapshots(),
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

                String? currentUid = FirebaseAuth.instance.currentUser?.uid;

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
