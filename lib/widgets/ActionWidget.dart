import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {

  final DeadlineAction _action;

  ActionWidget(this._action) {
    Firestore.instance.collection('books').document()
        .setData({ 'title': 'title', 'author': 'author' });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_action.description),
    );
  }

}