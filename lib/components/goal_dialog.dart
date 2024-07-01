import 'package:flutter/material.dart';

class GoalDialog extends StatelessWidget {
  final int position;

  GoalDialog({required this.position});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("ゴール！！！"),
      icon: Icon(Icons.flag,color: Colors.red,),
      content: Text("ゴールおめでとう"),
      actions: [
        TextButton(
          onPressed: () {
            //ランキング画面へ
          },
          child: Text('ランキング＞'),
        ),
      ],
    );
  }
}
