import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/views/member_select_screen.dart';

class Attention extends StatefulWidget {
  final int flag;
  const Attention ({super.key, required this.flag});
  @override
  State<StatefulWidget> createState() => _Attention();
}

class _Attention extends State<Attention> {
  
  @override
  Widget build(BuildContext context) {
    //遷移する画面のフラグ
    int flag = widget.flag;
    return Container(
      //背景のグラデーション処理
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
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 350.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: 20.w), // パディングの調整
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "注意",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "このアプリを楽しんで遊んでもらうために",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "過度な飲酒を控えて、適度な量とペースで飲みましょう。",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "また、店内で遊ぶ場合は",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "他のお客様やお店側の迷惑にならないようにしましょう。",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "*このアプリによるトラブルや問題については当社は一切責任を負いません。",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 6.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          color: Colors.white),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      child: Center(
                        child: Text(
                          "戻る",
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pop(context,Bu)
                      if(flag == 0){

                      }else{
                        
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemberSelectScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff43BBEF),
                              Color(0xffA1C7D7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Center(
                        child: BorderedText(
                          strokeWidth: 3.0.sp,
                          strokeColor: Colors.black,
                          child: Text(
                            "次へ",
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
