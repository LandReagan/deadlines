import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:deadlines/widgets/ActionWidget.dart';
import 'package:deadlines/widgets/NewActionDialog.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {

  void _processNewAction(DeadlineAction action) {
    print('Processing action: ' + action.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deadlines"),
      ),
      body: ListView(
        children: <Widget>[
          ActionWidget(DeadlineAction('DUmmy Action', DateTime.now())),
        ],
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