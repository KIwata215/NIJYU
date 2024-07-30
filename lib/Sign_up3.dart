import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/component/textformfield.dart';
import 'package:nijyu/test_nextPage.dart';


class Sign_Up3 extends StatefulWidget{
  final String name;
  final String email;
  final String telephone;
  final String password;
  final String dateofbirth;

  const Sign_Up3({
    Key? key, 
    required this.name, 
    required this.email, 
    required this.telephone, 
    required this.password, 
    required this.dateofbirth
    }) : super(key: key);
State<Sign_Up3> createState() => _Sign_up3(); 
}
class _Sign_up3 extends State<Sign_Up3> {
  
  final TextEditingController favoritealcohol_controller = TextEditingController();
  final TextEditingController not_favoritealcohol_controller = TextEditingController();
  
  int? _sectedchoice =null;

  // 名前、メールアドレス、電話番号が入力されているかのフラグ
  bool isButtonEnabled = false;
  // 画面が破棄されたときの処理
  @override
  void dispose() {
    favoritealcohol_controller.dispose();
    not_favoritealcohol_controller.dispose();
    super.dispose();
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
      child:  Scaffold(
        //キーボード表示エラーを解消
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        //appBarの高さの設定
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0.h),
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: AppBar(
              iconTheme: IconThemeData(
              color: Colors.white
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: BorderedText(
                strokeWidth: 3.0.sp,
                strokeColor: Colors.black,
                child: Text(
                  "アカウント新規登録",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              actions: [
                Image.asset('assets/images/flow3.png'),
                SizedBox(width: 10.w,),
              ],
            ),
          )
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              //お酒の得意度(任意)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BorderedText(
                    strokeWidth: 2.0.sp,
                    strokeColor: Colors.black,
                    child: Text(
                      "お酒を飲むのは好きですか？",
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ),
                  SizedBox(height: 3.h,),
                  Wrap(
                    spacing: 20.sp,
                    children: [
                      ChoiceChip(
                        // タップ時のチェックマークを非表示にする
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        // サイズを調整する
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        label: Text(
                          "得意",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,

                          ),
                        ), 
                        selected: _sectedchoice == 1,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.green,
                        onSelected: (_){
                          setState(() {
                            _sectedchoice =1;
                            print("お酒が得意が選択されました");
                          });
                        },
                      ),
                      ChoiceChip(
                        // タップ時のチェックマークを非表示にする
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        // サイズを調整する
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        label: Text(
                          "普通",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          ), 
                        selected: _sectedchoice == 2,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.green,
                        onSelected: (_){
                          setState(() {
                            _sectedchoice =2;
                            
                          });
                        },
                      ),
                      ChoiceChip(
                        // タップ時のチェックマークを非表示にする
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        // サイズを調整する
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        label: Text(
                          "苦手",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          ), 
                        selected: _sectedchoice == 3,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.green,
                        onSelected: (_){
                          setState(() {
                            _sectedchoice =3;
                            print("お酒が苦手が選択されました");
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  //好きなお酒（任意)
                  TextFormField_Component(
                    height: 45.h, 
                    width: 190.w, 
                    labelText: "好きなお酒、よく飲むお酒を教えてください", 
                    controller: favoritealcohol_controller, 
                    keyboardType: TextInputType.text, 
                    obscuretext: false
                  ),
                  SizedBox(height: 20.h,),
                  //嫌いなお酒(任意)
                  TextFormField_Component(
                    height: 45.h, 
                    width: 190.w, 
                    labelText: "嫌いなお酒、苦手なお酒を教えてください", 
                    controller: not_favoritealcohol_controller, 
                    keyboardType: TextInputType.text, 
                    obscuretext: false
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      backgroundColor: 
                       Colors.yellow,
                      fixedSize: Size(50.w, 32.h),
                    ),
                    onPressed: 
                     () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => test_nextPage()));
                    },
                    child: BorderedText(
                      child: Text(
                        "次へ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    )
                  ),
                  SizedBox(width: 20.w,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}