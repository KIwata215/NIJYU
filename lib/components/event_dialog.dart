import 'package:flutter/material.dart';
import 'package:nijyu/constants/events.dart';

class EventDialog extends StatelessWidget {
  final int position;

  EventDialog({required this.position});

  @override
  Widget build(BuildContext context) {
    // int eventIndex = position;
    int eventIndex = position >= 29 ? 29 : position;
    Event currentEvent = events[eventIndex];
    String titleText = eventIndex == 29 ? 'ゴール！！！' : 'イベント発生！';

    return AlertDialog(
      title: Text(titleText),
      icon: eventIndex == 29 ? Icon(null) : Icon(Icons.circle, //現在地がゴールマスならアイコンを表示しない、それ以外は〇アイコン表示
                                              color: currentEvent.category == '赤' ? Colors.red : //赤マス
                                                      currentEvent.category == '黄' ? Colors.yellow : //黄色マス
                                                      currentEvent.category == '緑' ? Colors.green : //緑マス
                                                      null), //ゴールマス
      backgroundColor: currentEvent.category == '赤' ? const Color.fromARGB(255, 251, 180, 175) : //赤マス
                       currentEvent.category == '黄' ? const Color.fromARGB(255, 255, 248, 182) : //黄色マス
                       currentEvent.category == '緑' ? const Color.fromARGB(255, 182, 255, 184) : //緑マス
                                                             Colors.white,
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
