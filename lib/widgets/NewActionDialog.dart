import 'package:deadlines/objects/DeadlineAction.dart';
import 'package:deadlines/utils/DateTimeUtils.dart';
import 'package:flutter/material.dart';

class NewActionDialog extends StatefulWidget {
  _NewActionDialogState createState() => _NewActionDialogState();
}

class _NewActionDialogState extends State<NewActionDialog> {

  String _description;
  DateTime _deadline;

  DeadlineAction _createAction() {
    return DeadlineAction(_description, _deadline);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text('New Action:'),),
      contentPadding: EdgeInsets.all(20.0),
      backgroundColor: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      children: <Widget>[
        // Action description
        TextField(
          onChanged: (String value) => _description = value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            fillColor: Colors.white,
            filled: true,
            labelText: 'Action'
          ),
        ),

        // Deadline
        GestureDetector(
          onTap: () async {
            DateTime newDeadline = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 3650))
            );
            setState(() {
              if (newDeadline != null) {
                _deadline = newDeadline;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Text(
              _deadline == null ? 'DEADLINE' : DateTimeUtils.dateString(_deadline),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Buttons
        Row(
          children: <Widget>[
            // Cancel
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, null),
              child: Text('CANCEL'),
            ),
            Expanded(
              child: SimpleDialogOption(
                onPressed: () => Navigator.pop(context, _createAction()),
                child: Text('CREATE', textAlign: TextAlign.right,),
              ),
            ),
          ],
        )
      ],
    );
  }
}
