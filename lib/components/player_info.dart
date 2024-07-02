import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/constants/colors.dart';
import 'package:nijyu/constants/player.dart';

class PlayerInfo extends StatelessWidget {
  final Player player;
  final bool isCurrentPlayer;

  PlayerInfo({required this.player, this.isCurrentPlayer = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        color: colors.playerInfo,
      ),
      child: Center(
        child: Text(
          '${player.name}: ${player.score}点 残り${player.remainingMath}マス 現在位置: ${player.position}',
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
