import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/Sign_up2.dart';
import 'package:nijyu/component/textformfield.dart';
import 'package:nijyu/validator/email_validator.dart';
import 'package:nijyu/validator/max_length_validator.dart';
import 'package:nijyu/validator/required_validator.dart';
import 'package:nijyu/validator/telephone_validator.dart';

class Sign_Up1 extends StatefulWidget{

  const Sign_Up1({Key? key}) : super(key: key);
State<Sign_Up1> createState() => _Sign_up1(); 
}
class _Sign_up1 extends State<Sign_Up1> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController telephonecontroller = TextEditingController();

  // 名前、メールアドレス、電話番号が入力されているかのフラグ
  bool isButtonEnabled = false;
  // 画面が破棄されたときの処理
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    telephonecontroller.dispose();
    super.dispose();
  }

  //入力する名前
  String _name = '';
  String _email = '';
  String _telephone = '';


  //名前のバリデーションの結果
  bool _isValidName = false;

  //メールアドレスのバリデーション結果
  bool _isValidEmail = false;

  //電話番号のバリデーションチェックの結果
  bool _isValidTelephone = false;


  void _setIsValidName (bool isValid) {
    setState(() {
      _isValidName = isValid;
    });
  }

  void _setIsValidEmail (bool isValid) {
    setState(() {
      _isValidEmail = isValid;
    });
  }

  void _setIsValidTelephone (bool isValid) {
    setState(() {
      _isValidTelephone = isValid;
    });
  }
  //全てのバリデーションチェックの結果を返す
  bool _isAllValid(){
    return _isValidName && _isValidEmail && _isValidTelephone;
  }

  void _setName( String name ){
    setState(() {
      _name = name;
    });
  }

  void _setEmail( String email ){
    setState(() {
      _email = email;
    });
  }


  void _setTelephone( String telephone  ){
    setState(() {
      _telephone = telephone;
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
                Image.asset('assets/images/flow1.png'),
                SizedBox(width: 10.w,),
              ],
            ),
          )
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField_Component_Validator(
                keyboardtype: TextInputType.text,
                labelText: "名前", 
                height: 55.h, 
                width: 85.w, 
                controller: namecontroller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  MaxLengthValidator(10),
                ], 
                onChage: _setName, 
                setIsValid: _setIsValidName,
              ),
              SizedBox(height: 20.h,),
              TextFormField_Component_Validator(
                keyboardtype: TextInputType.emailAddress,
                labelText: "メールアドレス", 
                height: 55.h, 
                width: 85.w, 
                controller: emailcontroller, 
                obscuretext: false,
                validators: [
                  RequiredValidator(), 
                  EmailValidator()
                ], 
                onChage: _setEmail, 
                setIsValid: _setIsValidEmail,
              ),
              SizedBox(height: 20.h,),
              TextFormField_Component_Validator(
                keyboardtype: TextInputType.phone,
                labelText: "電話番号", 
                height: 55.h, 
                width: 85.w, 
                controller: telephonecontroller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  TelephoneValidator()
                ], 
                onChage: _setTelephone, 
                setIsValid: _setIsValidTelephone,
              ),
              // SizedBox(height: 10.h,),
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
                      print(_name);
                      print(_email);
                      print(_telephone);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Sign_Up2(
                          name: _name,
                          email: _email,
                          telephone: _telephone,
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