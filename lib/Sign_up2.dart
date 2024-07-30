import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/Sign_up3.dart';
import 'package:nijyu/component/date_of_birth.dart';
import 'package:nijyu/component/textformfield.dart';
import 'package:nijyu/validator/password_validator.dart';
import 'package:nijyu/validator/required_validator.dart';

class Sign_Up2 extends StatefulWidget{
  final String name;
  final String email;
  final String telephone;

   Sign_Up2({
    Key? key, 
    required this.name, 
    required this.email, 
    required this.telephone
    }) : super(key: key);
State<Sign_Up2> createState() => _Sign_up2(); 
}
class _Sign_up2 extends State<Sign_Up2> {
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController password_2_controller = TextEditingController();
  final TextEditingController date_of_birthcontroller = TextEditingController();


  // 名前、メールアドレス、電話番号が入力されているかのフラグ
  bool isButtonEnabled = false;
  // 画面が破棄されたときの処理
  @override
  void dispose() {
    password_controller.dispose();
    password_2_controller.dispose();
    date_of_birthcontroller.dispose();
    super.dispose();
  }

  //入力する名前
  String _password = '';
  String _password2 = '';


  //名前のバリデーションの結果
  bool _isValidPassword = false;

  //メールアドレスのバリデーション結果
  bool _isValidPassword2 = false;



  void _setIsValidPassword (bool isValid) {
    setState(() {
      _isValidPassword = isValid;
    });
  }

  void _setIsValidPassword2 (bool isValid) {
    setState(() {
      _isValidPassword2 = isValid;
    });
  }

  //全てのバリデーションチェックの結果を返す
  bool _isAllValid(){
    return _isValidPassword && _isValidPassword2 ;
  }

  void _setPassword( String password ){
    setState(() {
      _password = password;
    });
  }

  void _setPassword2( String password2 ){
    setState(() {
      _password2 = password2;
    });
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
                Image.asset('assets/images/flow2.png'),
                SizedBox(width: 10.w,),
              ],
            ),
          )
        ),
        body: Center(
          child: Column(
            children: [
              // SizedBox(height: 20.h,),
              DateOfBirth(
                height: 45.h, 
                width: 190.w, 
                controller: date_of_birthcontroller, 
                label: "生年月日",
              ),
              SizedBox(height: 20.h,),
              TextFormField_Component_Validator(
                labelText: 'パスワード', 
                height: 55.h, 
                width: 85.w, 
                controller: password_controller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  PasswordValidator(),
                ],
                onChage: _setPassword,
                setIsValid: _setIsValidPassword, 
              ),
              SizedBox(height: 20.h,),
              TextFormField_Component_Validator(
                labelText: '確認用パスワード', 
                height: 55.h, 
                width: 85.w, 
                controller: password_2_controller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  PasswordValidator(),
                ],
                onChage: _setPassword2,
                setIsValid: _setIsValidPassword2, 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      backgroundColor: _isAllValid()
                      ? Colors.lightBlue
                      : Colors.white,
                      fixedSize: Size(50.w, 32.h),
                    ),
                    onPressed: _isAllValid()
                    ? () {
                      print(widget.name);
                      print(widget.email);
                      print(widget.telephone);
                      print(_password);
                      print(_password2);
                      print(date_of_birthcontroller.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Sign_Up3(
                          name: widget.name, 
                          email: widget.email, 
                          telephone: widget.telephone, 
                          password: _password, 
                          dateofbirth: date_of_birthcontroller.text,
                        )));
                    } : null,
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