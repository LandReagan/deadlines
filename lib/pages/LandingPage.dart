import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deadlines/database/Database.dart';
import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:deadlines/utils/DateTimeUtils.dart';
import 'package:deadlines/widgets/ActionWidget.dart';
import 'package:deadlines/widgets/NewActionDialog.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {

  void _processNewAction(DeadlineAction action) {
    print('Processing action: ' + action.toString());
    Database.addNewAction(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deadlines"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Database.getActionStream(),
        builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Text('Loading...');
            default:
              return ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  DateTime deadline = DateTimeUtils.parseDateString(document.data['deadline']);
                  DeadlineAction action = DeadlineAction(document.data['description'], deadline);
                  return ActionWidget(action);
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Deadline',
        child: Icon(Icons.add),
        onPressed: () async {
          _processNewAction(
            await showDialog<DeadlineAction>(
              context: context,
              builder: (context) => NewActionDialog(),
            )
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}