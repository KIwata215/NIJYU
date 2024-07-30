import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  final GestureTapCallback onpress;
  final double height;
  final double width;
  final double iconheight;
  final double iconwidth;
  final String image;
  final Color backgroundColor; // 背景色プロパティ
  final Color textColor; // 文字色プロパティ

  Button({
    required this.text,
    required this.onpress,
    required this.height,
    required this.width,
    required this.iconheight,
    required this.iconwidth,
    required this.image,
    required this.backgroundColor, // 背景色を受け取る
    required this.textColor, // 文字色を受け取る
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // 背景色を設定
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r), // ボタンの角の丸み
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // アイコンを左寄せ
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: iconwidth,
              height: iconheight,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: textColor, // 文字色を設定
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}