import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/login.dart';
import 'package:nijyu/sign_up1.dart';
class Start extends StatefulWidget {
  State<Start> createState() => StartPage();
}
class StartPage extends State<Start>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(height:40.h,),
              SizedBox(
                height: 50.h,
                width: 150.w,
                child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(width: 1.r,color: Color(0xffDA20EA),),
                ),
                onPressed:(){ 
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>Login())
                  );
                }, 
                child: const Text(
                  "ログイン",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffDA20EA),
                  ),
                ),
              ),
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 50.h,
                width: 150.w,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    side: BorderSide(width: 1.r,color: Color(0xffDA20EA),),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //仮　ここに新規登録のページのルートを書く
                        builder: (context) => Sign_Up1()));
                  }, 
                  child: const Text(
                    "新規登録",
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.transparent
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}