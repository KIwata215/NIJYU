import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nijyu/components/event_dialog.dart';
import 'package:nijyu/components/player_info.dart';
import 'package:nijyu/constants/events.dart';
import 'package:nijyu/providers/player_provider.dart';
import 'package:provider/provider.dart';
import 'package:nijyu/constants/times.dart';

class SugorokuGame extends StatefulWidget {
  const SugorokuGame({super.key});

  @override
  _SugorokuGameState createState() => _SugorokuGameState();
}

class _SugorokuGameState extends State<SugorokuGame> {
  int _diceRoll = 1; // サイコロの目
  bool _isRolling = false; // サイコロ回転フラグ
  Timer? _timer; // サイコロを止めるまでランダムに変更するためのタイマー

  // サイコロの目をランダムに変更するタイマーを開始
  void _startRolling() {
    setState(() {
      _isRolling = true; // サイコロ回転中フラグ
    });
    _timer = Timer.periodic(
        const Duration(milliseconds: AnimationTimes.sugorokuAnimationMillis),
        (timer) {
      setState(() {
        _diceRoll = (1 + (DateTime.now().millisecondsSinceEpoch % 6)).toInt();
      });
    });
  }

  // タイマーを停止し、ボードの位置更新
  void _stopRolling() {
    _timer?.cancel(); // タイマー停止
    setState(() {
      _isRolling = false; // サイコロ停止中フラグ
      Provider.of<MoveMathProvider>(context, listen: false)
          .moveBoard(_diceRoll);
      Provider.of<PlayerProvider>(context, listen: false).movePlayer(_diceRoll);
      Future.delayed(
          Duration(milliseconds: AnimationTimes.animationDurationMillis), () {
        _showEventDialog(
            Provider.of<PlayerProvider>(context, listen: false).position);
      });
      // イベント表示が終わったら次のプレイヤーにターンを進める
      Provider.of<PlayerProvider>(context, listen: false).nextPlayer();

      print('サイコロの目: $_diceRoll'); // サイコロの値を出力
    });
  }

  void _showEventDialog(int position) {
    showDialog(
      context: context,
      builder: (context) {
        return EventDialog(position: position);
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _isRolling ? _stopRolling : _startRolling,
            child: Text(_isRolling ? 'サイコロを止める' : 'サイコロを振る'),
          ),
          SizedBox(height: 20),
          Image.asset('assets/dice_images/dice_$_diceRoll.jpg',
              width: 100, height: 100),
          SizedBox(height: 20),
          //Board(),
        ],
      ),
    );
  }
}
