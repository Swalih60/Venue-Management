// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:venue/components/components.dart';

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
    selectedDate = DateTime.now().subtract(const Duration(days: 1));
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
