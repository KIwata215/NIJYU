import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double lineWidth = constraints.maxWidth; // Dividerの横幅
        final double dashWidth = 3.0.w; // 点線の幅
        final double dashSpace = 2.0.w; // 線と線の間隔

        // 点線の個数を計算
        int dashCount = (lineWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(dashCount, (index) {
            return Container(
              width: dashWidth,
              height: 2.0.h, // 点線の高さ
              color: Colors.black, // 点線の色
              margin: EdgeInsets.only(right: dashSpace),
            );
          }),
        );
      },
    );
  }
}
