import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/components/dott_divider.dart';
import 'package:nijyu/ranking_last.dart';
import 'package:nijyu/ranking_past.dart';
import 'package:bordered_text/bordered_text.dart';

class Ranking_Now_Page extends StatefulWidget {
  State<StatefulWidget> createState() => _Ranking_Now_Page();
}

class _Ranking_Now_Page extends State<Ranking_Now_Page> {
  @override
  Widget build(BuildContext context) {
    // スコア順にソート (score + plusscore)
    ranking.sort(
        (a, b) => (b.score + b.plusScore).compareTo(a.score + a.plusScore));
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
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/currentranking.png"),
                    Expanded(
                      child: ListView.builder(
                          itemCount: ranking.length,
                          itemBuilder: (context, index) {
                            final player = ranking[index];
                            String imagePath = 'assets/images/number1.png';
                            //順位に応じた画像のimageパスを設定
                            if (index == 1) {
                              imagePath = 'assets/images/number2.png';
                            } else if (index == 2) {
                              imagePath = 'assets/images/number3.png';
                            } else if (index == 3) {
                              imagePath = 'assets/images/number4.png';
                            } else if (index == 4) {
                              imagePath = 'assets/images/number5.png';
                            } else if (index == 5) {
                              imagePath = 'assets/images/number6.png';
                            }
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        imagePath,
                                        width: 40.w,
                                        height: 65.h,
                                      ),
                                      Container(
                                        width: 120.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 20.w),
                                                Text(
                                                  player.name,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            DottedDivider(),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Text(
                                                  '${player.score}Pt+',
                                                  style: TextStyle(
                                                      fontSize: 6.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${player.plusScore}Pt',
                                                  style: TextStyle(
                                                    fontSize: 6.5.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.h,
                right: 20.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ranking_Last_Page()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Container(
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
              )
            ],
          )),
    );
  }
}
