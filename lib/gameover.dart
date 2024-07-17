import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/constants/player.dart';
import 'package:nijyu/ranking_past.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/select.dart';

class GameOver_Page extends StatelessWidget {
  final Player winner;

  GameOver_Page({required this.winner});

  @override
  Widget build(BuildContext context) {
    // 合計スコアでプレイヤーをソート
    ranking.sort(
        (a, b) => (b.score + b.plusScore).compareTo(a.score + a.plusScore));

    // 優勝者
    //Player winner = ranking.first;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff8C2388),
            Color(0xff9A30BF),
            Color(0xff2D3AAF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/crown.png',
            ),
            Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    '${winner.name}さんの優勝',
                    style: TextStyle(
                      fontSize: 7.sp,
                      color: Colors.black,
                      // 下線を削除
                      decoration: TextDecoration.none,
                    ),
                  ),
                )),
            Container(
              width: 260.w,
              height: 90.h,
              child: Image.asset(
                'assets/images/congratulations.png',
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "今回一番飲んだお酒は",
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              '${winner.category}!!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Container(
                    width: 60.w,
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xff43BBEF),
                            Color(0xffA1C7D7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: BorderedText(
                        strokeWidth: 3.0.sp,
                        strokeColor: Colors.white,
                        child: Text(
                          '次へ',
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
