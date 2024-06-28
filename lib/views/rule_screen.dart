import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/components/number_circle.dart';
import 'package:nijyu/constants/colors.dart';
import 'package:nijyu/views/sugoroku_screen.dart';
import 'package:nijyu/constants/colors.dart';

class RuleScreen extends StatelessWidget {
  final int width = 300;
  final int fontSize = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 50.h),
            // 上のグラデーション
            Container(
              width: width.w,
              height: 90.h,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    colors.gradation1,
                    colors.gradation2,
                    colors.gradation3,
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'ルール説明',
                  style: TextStyle(
                    color: colors.textWhite,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // 下のルール説明
            Container(
              width: width.w,
              height: 300.h,
              decoration: ShapeDecoration(
                color: colors.ruleBackgroundBeige,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RuleItem(number: 1, text: 'サイコロを振って進もう！'),
                        RuleItem(
                            number: 2,
                            text: '止まったマスのお題をクリアして、たくさんのポイントを獲得しよう！'),
                        RuleItem(number: 3, text: 'ポイントを一番獲得した人の勝ち！'),
                        RuleItem(number: 4, text: '最初にゴールした人はゴールポイントが貰えるよ！'),
                        SizedBox(height: 10.h),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoveMathScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: colors.startButtonBlue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'スタート',
                        style: TextStyle(
                          color: colors.textWhite,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RuleItem extends StatelessWidget {
  final int number;
  final String text;

  RuleItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NumberCircle(
            number: number,
            color: colors.gradation2, // 色を変更したい場合はここを変更
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: colors.textBlack,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
