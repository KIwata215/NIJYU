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
      height: 75.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        color: player.color,
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${player.name}\n',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: colors.textWhite,
                ),
              ),
              TextSpan(
                text: '残り${player.remainingMath}マス   ${player.score}pt',
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.textWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
