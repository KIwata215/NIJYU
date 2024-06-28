import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberCircle extends StatelessWidget {
  final int number;
  final Color color;
  final double size;

  NumberCircle({required this.number, required this.color, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.3.sp, // 数字のサイズを調整
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
