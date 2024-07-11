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

// ラウンド管理
class RoundProvider with ChangeNotifier {
  int _currentRound = 1; // 現在のラウンド
  int _totalRounds = 0; // 指定ラウンド数
  int _playerCount; // プレイヤーの数
  late List<List<int>> _roundScores; // プレイヤーごとのスコア保存2次元配列
  late List<bool> _selectedMaps = []; // 選択ラウンド数配列

  RoundProvider(this._totalRounds, this._playerCount, int mapCount) {
    _roundScores = List.generate(_totalRounds,
        (_) => List.filled(_playerCount, 0)); // 各ラウンドごとにプレイヤーのスコアを初期化
    _selectedMaps = List.filled(mapCount, false); // 各マップの選択状態を初期化
  }

  int get currentRound => _currentRound; // 現在のラウンドを取得
  int get totalRounds => _totalRounds; // 指定ラウンド数を取得
  List<List<int>> get roundScores => _roundScores; // プレイヤーごとのスコア取得
  List<bool> get totalRoundsArray => _selectedMaps; // 選択ラウンド数配列取得

  // 次のラウンド
  void nextRound() {
    // 現在のラウンドが最終ラウンドに達していない場合
    if (_currentRound < _totalRounds) {
      _currentRound++;
      notifyListeners();
    }
  }

  // プレイヤーのスコアを現在のラウンドのスコアに更新
  void updatePlayerScore(int playerIndex, int score) {
    if (_currentRound > 0 && _currentRound <= _totalRounds) {
      _roundScores[_currentRound - 1][playerIndex] += score;
      notifyListeners();
    }
  }

  // マップの選択状態更新
  void selectMap(int index, bool isSelected) {
    if (index >= 0 && index < _selectedMaps.length) {
      _selectedMaps[index] = isSelected;
      notifyListeners();
    }
  }
}
