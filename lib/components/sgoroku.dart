import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nijyu/providers/player_provider.dart';
import 'package:provider/provider.dart';

class SugorokuGame extends StatefulWidget {
  const SugorokuGame({super.key});

  @override
  _SugorokuGameState createState() => _SugorokuGameState();
}

class _SugorokuGameState extends State<SugorokuGame> {
  int _diceRoll = 1;
  bool _isRolling = false;
  Timer? _timer;

  void _startRolling() {
    setState(() {
      _isRolling = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _diceRoll = (1 + (DateTime.now().millisecondsSinceEpoch % 6)).toInt();
      });
    });
  }

  void _stopRolling() {
    _timer?.cancel();
    setState(() {
      _isRolling = false;
      Provider.of<PlayerProvider>(context, listen: false).movePlayer(_diceRoll);
      print('サイコロの目: $_diceRoll'); // サイコロの値を出力
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugoroku Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRolling ? _stopRolling : _startRolling,
              child: Text(_isRolling ? 'サイコロを止める' : 'サイコロを振る'),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/dice_$_diceRoll.jpg',
                width: 100, height: 100),
            SizedBox(height: 20),
            //Board(),
          ],
        ),
      ),
    );
  }
}
