import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {

  final DeadlineAction _action;

  ActionWidget(this._action);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_action.description),
    );
  }

}