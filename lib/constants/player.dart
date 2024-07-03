import 'package:flutter/material.dart';
import 'package:nijyu/constants/colors.dart';

class Player {
  String name; //名前
  String category; //飲むお酒
  int score; //今までの合計スコア
  int remainingMath; // 残りマス数
  int plusScore;
  int position; // 場所
  Color color;
  String playerImages;

  Player({
    required this.name,
    required this.category,
    required this.score,
    required this.remainingMath,
    required this.plusScore,
    this.position = 0,
    required this.color,
    required this.playerImages,
  });
}
