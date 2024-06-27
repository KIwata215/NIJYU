import 'package:flutter/material.dart';
import 'package:nijyu/constants/events.dart';

class EventDialog extends StatelessWidget {
  final int position;

  EventDialog({required this.position});

  @override
  Widget build(BuildContext context) {
    int eventIndex = position % events.length;
    Event currentEvent = events[eventIndex];

    return AlertDialog(
      title: Text('イベント発生！'),
      content: Text(currentEvent.description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('閉じる'),
        ),
      ],
    );
  }
}
