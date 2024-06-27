import 'package:flutter/material.dart';
import 'package:nijyu/constants/player.dart';

// プレイヤーの位置管理
class PlayerProvider with ChangeNotifier {
  List<Player> _players = [];
  int _position = 0; // プレイヤーの位置

  List<Player> get players => _players;
  int get position => _position; // 現在地を返す

  void setPlayers(List<Player> players) {
    _players = players;
    notifyListeners();
  }

  void movePlayer(int steps) {
    _position += steps;
    // マスの最後
    if (_position >= 30) {
      _position = 29; // ボードの最後の位置に固定
    }
    print('現在の進んだマス：$_position');
    notifyListeners(); // 状態変更をリスナーに通知
  }
}

// ボードの位置管理
class MoveMathProvider with ChangeNotifier {
  int _currentPosition = 0; // ボードの現在地

  int get currentPosition => _currentPosition; // ボードの現在地を返す

  void moveBoard(int steps) {
    _currentPosition = steps;
    notifyListeners();
  }
}
