import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseCRUD {
  final CollectionReference venues =
      FirebaseFirestore.instance.collection('venues');

  Future<void> addVenue(String event, String name, String sTime, String eTime,
      String date, String branch, String sem) {
    return venues.add({
      'event': event,
      'name': name,
      'sTime': sTime,
      'eTime': eTime,
      'date': date,
      'branch': branch,
      'sem': sem,
      'timeStamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> readVenue() {
    return venues.orderBy('timeStamp').snapshots();
  }
}
