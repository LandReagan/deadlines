import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:deadlines/widgets/ActionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatelessWidget {
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
    );
  }

}