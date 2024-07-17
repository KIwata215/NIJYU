import 'package:flutter/material.dart';
import 'package:nijyu/constants/events.dart';
import 'package:nijyu/ranking_last.dart';
import 'package:nijyu/ranking_past.dart';

class EventDialog extends StatelessWidget {
  final int position;

  EventDialog({required this.position});

  @override
  Widget build(BuildContext context) {
    // int eventIndex = position;
    int eventIndex = position >= Math.math - 1 ? Math.math - 1 : position;
    Event currentEvent = events[eventIndex];
    String titleText = eventIndex == Math.math - 1 ? 'ゴール！！！' : 'イベント発生！';

    return AlertDialog(
      title: Text(titleText),
      icon: eventIndex == Math.math - 1
          ? Icon(null)
          : Icon(Icons.circle, //現在地がゴールマスならアイコンを表示しない、それ以外は〇アイコン表示
              color: currentEvent.category == '赤'
                  ? Colors.red
                  : //赤マス
                  currentEvent.category == '黄'
                      ? Colors.yellow
                      : //黄色マス
                      currentEvent.category == '緑'
                          ? Colors.green
                          : //緑マス
                          null), //ゴールマス
      backgroundColor: currentEvent.category == '赤'
          ? const Color.fromARGB(255, 251, 180, 175)
          : //赤マス
          currentEvent.category == '黄'
              ? const Color.fromARGB(255, 255, 248, 182)
              : //黄色マス
              currentEvent.category == '緑'
                  ? const Color.fromARGB(255, 182, 255, 184)
                  : //緑マス
                  Colors.white,
      content: eventIndex == Math.math - 1
          ? Text('Congratulation!!!')
          : Text(currentEvent.description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (eventIndex == Math.math - 1) {
              // ゴールの場合はランキング画面に遷移
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Ranking_Last_Page(),
                ),
              );
            }
          },
          child: Text('閉じる'),
        ),
      ],
    );
  }
}
