import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/select.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sugoroku_background_images/homeBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                AccountButton(name: "アカウント名", point: 20),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        height: 45, 
                        width: 45, 
                        text: "戦歴",
                        onpressed: (){
                          
                        },
                      ),
                      SizedBox(height: 20.h), // 下部マージン調整
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Image.asset(
                    'assets/sugoroku_background_images/character.png',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        height: 45, 
                        width: 75, 
                        text: "GAMESTART",
                        onpressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => SelectPage()));
                        },
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final GestureTapCallback onpressed;
  ActionButton({required this.height, required this.width, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  final String name;
  final int point;
  AccountButton({required this.name, required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // Containerと同じ背景色に設定
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), // Containerと同じ角丸に設定
          ),
        ),
        onPressed: () {},
        child: Column(
          children: [
            SizedBox(height: 10.h, width: 10.w),
            Row(
              children: [
                Image.asset("assets/sugoroku_background_images/icon.png"),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6D32AD),
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              "保有ポイント: $point pt",
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff6D32AD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
