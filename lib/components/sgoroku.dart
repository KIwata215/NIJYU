import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nijyu/components/event_dialog.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int _sumDice = 0;
  bool _isRolling = false; // サイコロ回転フラグ
  Timer? _timer; // サイコロを止めるまでランダムに変更するためのタイマー
  bool _isProcessing = false; // 重複処理を防ぐためのフラグ
  bool _hasMovedBoard = false;

  // サイコロの目をランダムに変更するタイマーを開始
  void _startRolling() {
    if (_isProcessing) return;
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
  void _stopRolling() async {
    if (_isProcessing) return;
    // _isProcessing = true; // 処理中フラグを設定
    _timer?.cancel(); // タイマー停止
    setState(() {
      _sumDice += _diceRoll;
      _isRolling = false; // サイコロ停止中フラグ
    });

    Provider.of<MoveMathProvider>(context, listen: false).moveBoard(_diceRoll);

    Provider.of<PlayerProvider>(context, listen: false).movePlayer(_diceRoll);

    await Future.delayed(
        Duration(milliseconds: AnimationTimes.animationDurationMillis));

    int currentPlayerPosition =
        Provider.of<PlayerProvider>(context, listen: false)
            .currentPlayer
            .position;
    await _showEventDialog(currentPlayerPosition - 1);

    // イベント表示が終わったら次のプレイヤーにターンを進める
    Provider.of<PlayerProvider>(context, listen: false).nextPlayer();
    _isProcessing = false; // 処理中フラグを解除

    print('サイコロの目: $_diceRoll'); // サイコロの値を出力
  }

  Future<void> _showEventDialog(int position) {
    return showDialog<void>(
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
              child: BorderedText(
                  strokeWidth: 1.0.sp,
                  strokeColor: Colors.black,
                  child: Text(
                    _isRolling ? 'サイコロを止める' : 'サイコロを振る',
                    style: TextStyle(
                      fontSize: 6.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400], // ボタンの背景色
                  foregroundColor: Colors.white, // ボタンのテキスト色
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
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
