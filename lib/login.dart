import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/email_login.dart';
import 'package:nijyu/register2.dart';
import 'package:bordered_text/bordered_text.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => Loginpage();
}

class Loginpage extends State<Login> {
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0.h),
          child: Padding(
            padding: EdgeInsets.only(top: 100.0.h),
            child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: BorderedText(
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
          ),
        ),
        backgroundColor: Colors.transparent, // 背景色を透明にする
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 45.h,),
              BorderedText(
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
              SizedBox(height: 35.h,),
              Button(
                  height: 45,
                  width: 400,
                  backgroundColor: Colors.white,
                  text: 'メールアドレス',
                  textColor: Colors.black,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Email_Login()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/Mailicon.png',
                ),
              SizedBox(height: 25.h,),
              Button(
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
