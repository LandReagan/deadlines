import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:deadlines/utils/DateTimeUtils.dart';

class Database {
  static void addNewAction(DeadlineAction action) async {
    DocumentReference docRef = await Firestore.instance.collection('actions')
      .add(
        {
          'description': action.description,
          'deadline': DateTimeUtils.dateString(action.deadline),
        }
      );
    print(docRef);
  }

  static Stream<QuerySnapshot> getActionStream() {
    return Firestore.instance.collection('actions').snapshots();
  }
}