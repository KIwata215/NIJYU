import 'package:flutter/material.dart';
import 'package:nijyu/constants/player.dart';

class PlayerInfo extends StatelessWidget {
  final Player player;

  PlayerInfo({required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.yellow,
      ),
      child: Center(
        child: Text(
          '${player.name}: ${player.score}点 残り${player.remainingMath}マス',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
