import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/register2.dart';
import 'package:bordered_text/bordered_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => Loginpage();
}

class Loginpage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent, // 背景色を透明にする
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 48.h, bottom: 35.h),
                child: BorderedText(
                  strokeWidth: 3.0.sp, // 縁の太さ
                  strokeColor: Colors.black, // 縁の色
                  child: Text(
                    'ログイン',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white, // テキストの色
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25.h),
                child: BorderedText(
                  strokeWidth: 3.0.sp, // 縁の太さ
                  strokeColor: Colors.black, // 縁の色
                  child: Text(
                    'ログイン方法を選択してください',
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.white, // テキストの色
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Button(
                  height: 45,
                  width: 400,
                  backgroundColor: Colors.white,
                  text: 'メールアドレス',
                  textColor: Colors.black,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register2Page()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/Mailicon.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Button(
                  height: 45,
                  width: 400,
                  backgroundColor: Colors.white,
                  text: 'Google',
                  textColor: Colors.black,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register2Page()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/Googleicon.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Button(
                  height: 45,
                  width: 400,
                  backgroundColor: Colors.black,
                  text: 'Apple',
                  textColor: Colors.white,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register2Page()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/appleicon.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
