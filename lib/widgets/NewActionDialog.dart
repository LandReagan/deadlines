import 'package:deadlines/objects/DeadlineAction.dart';
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
