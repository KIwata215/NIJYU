import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/attention.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
  //home・storeimageのボタンが押されたときflag
  bool _isTappedHome = false;
  bool _isTappedStore = false;
  int flag =0;

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
   void _handleNextButtonPressed() {
    if (!_isTappedHome && !_isTappedStore) {

      // 両方が押されていない場合の処理
      print('いずれかのオプションを選択してください。');
    } else if (_isTappedHome) {
      flag =0;
      
      Navigator.push(
        context,MaterialPageRoute(
          builder: (context) => Attention(flag:flag)));
      
    } else if (_isTappedStore) {
      // Storeが押されている場合の処理
      flag =1;
      Navigator.push(
        context,MaterialPageRoute(
          builder: (context) =>  Attention(flag:flag)));
      print('お店でワイワイが選択されました。');
    }
  }


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
        backgroundColor: Colors.transparent, // 背景色を透明にする
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0.h),
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
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
              // Padding(padding: EdgeInsets.only(top: 10.h)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 75.w)),
                  Column(
                    children: [
                      InkWell(
                        onTap: _onTapHome,
                        child: Container(
                          margin: EdgeInsets.all(5.h),
                          padding: EdgeInsets.all(5.h),
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
                          margin: EdgeInsets.all(5.h),
                          padding: EdgeInsets.all(5.h),
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
                padding: EdgeInsets.only(top: 5.h),
                child:BorderedText(
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
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed:_handleNextButtonPressed,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        gradient: (_isTappedHome || _isTappedStore)
                        ? const LinearGradient(
                          colors: <Color>[
                            Color(0xff43BBEF),
                            Color(0xffA1C7D7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ) :null,
                        color: !_isTappedHome && !_isTappedStore ?
                        Colors.white: null,
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
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
