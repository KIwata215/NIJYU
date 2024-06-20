import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
  bool _isTappedHome = false;
  bool _isTappedStore = false;

  void _onTapHome() {
    setState(() {
      _isTappedHome = !_isTappedHome;
      if (_isTappedHome) _isTappedStore = false;
    });
  }

  void _onTapStore() {
    setState(() {
      _isTappedStore = !_isTappedStore;
      if (_isTappedStore) _isTappedHome = false;
    });
  }

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0.h),
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: AppBar(
              backgroundColor: Colors.transparent, // 背景色を透明にする
              title: BorderedText(
                strokeWidth: 3.0.sp,
                strokeColor: Colors.black,
                child: Text(
                  "すごろくで遊ぶ場所を選んでね！",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.h)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 75.w)),
                  Column(
                    children: [
                      InkWell(
                        onTap: _onTapHome,
                        child: Container(
                          decoration: BoxDecoration(
                            border: _isTappedHome ?
                            Border.all(color:Colors.white ,width: 1.w,)
                            :null
                          ),
                          child: Image.asset("assets/images/homeicon.png"),
                        ),
                      ),
                      BorderedText(
                        strokeWidth: 3.0.sp,
                        strokeColor: Colors.black,
                        child: Text(
                          "お家でワイワイ",
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 60.w)),
                  Column(
                    children: [
                      InkWell(
                        onTap: _onTapStore,
                        child: Container(
                          decoration: BoxDecoration(
                            border: _isTappedStore ?
                            Border.all(color:Colors.white ,width: 1.w,)
                            :null
                          ),
                          child: Image.asset("assets/images/storeicon.png"),
                        ),
                      ),
                      BorderedText(
                        strokeWidth: 3.0.sp,
                        strokeColor: Colors.black,
                        child: Text(
                          "お店でワイワイ",
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    BorderedText(
                      strokeWidth: 3.0.sp,
                      strokeColor: Colors.black,
                      child: Text(
                        "お家で手持ちのお酒を選ぶ",
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 40.w ))
                     
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       ElevatedButton(onPressed: (){},
              //       child: Text("次へ"))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
