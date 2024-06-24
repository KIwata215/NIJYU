import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  int _position = 0;

  int get position => _position;

  void movePlayer(int steps) {
    _position += steps;
    // マスの最後
    if (_position >= 30) {
      _position = 29; // ボードの最後の位置に固定
    }
    notifyListeners(); // 状態変更をリスナーに通知
  }
}
