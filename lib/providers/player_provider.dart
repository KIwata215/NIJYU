import 'package:flutter/material.dart';
import 'package:nijyu/constants/events.dart';
import 'package:nijyu/constants/player.dart';

// プレイヤーの位置管理
class PlayerProvider with ChangeNotifier {
  List<Player> _players = [];
  int _position = 0; // プレイヤーの位置
  int _currentPlayerIndex = 0;
  int _score = 0;

  List<Player> get players => _players;
  int get position => _position; // 現在地を返す
  int get currentPlayerIndex => _currentPlayerIndex;
  Player get currentPlayer => _players[_currentPlayerIndex];
  int get score => _score; // 合計獲得ポイント

  void nextPlayer() {
    _currentPlayerIndex = (_currentPlayerIndex + 1) % _players.length;
    notifyListeners();
  }

  void updatePlayerPosition(int steps) {
    // 現在のプレイヤーの位置を更新するロジックを追加
    _players[_currentPlayerIndex].remainingMath -= steps; // 残りマス数
    _players[_currentPlayerIndex].position += steps; // 現在のマス
    if (_players[_currentPlayerIndex].position > 30) {
      _players[_currentPlayerIndex].position = 30; // ボードの最後の位置に固定
    }
    updateScore();
    notifyListeners();
  }

  void updateScore() {
    // 現在のプレイヤーの位置に基づいてイベントを取得
    final int easy = 10;
    final int nomal = 20;
    final int hard = 30;
    if (_players[_currentPlayerIndex].position < 30) {
      final event = events[_players[_currentPlayerIndex].position];

      switch (event.category) {
        case '赤':
          _score += hard;
          _players[_currentPlayerIndex].score += hard;
          break;
        case '黄':
          _score += nomal;
          _players[_currentPlayerIndex].score += nomal;
          break;
        case '緑':
          _score += easy;
          _players[_currentPlayerIndex].score += easy;
          break;
      }
    }
  }

  void setPlayers(List<Player> players) {
    _players = players;
    notifyListeners();
  }

  void movePlayer(int steps) {
    updatePlayerPosition(steps);
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
