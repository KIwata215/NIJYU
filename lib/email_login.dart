import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:bordered_text/bordered_text.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nijyu/component/textformfield.dart';
import 'package:nijyu/validator/email_validator.dart';
import 'package:nijyu/validator/password_validator.dart';
import 'package:nijyu/validator/required_validator.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage ({ Key? key}) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPage();
}

class _EmailLoginPage extends State<EmailLoginPage> {
  //入力されたメールアドレス
  String newEmail ='';
  //入力されたパスワード
  String newPassword = '';
  
  //メールアドレスのバリデーションチェック
  bool _isValidEmail = false;

  //入力されたパスワードのバリデーションチェック
  bool _isValidPassword = false;

  //入力されたemailをステート保存
  void _setEmail(String email){
    setState(() {
      newEmail = email;
    });
  }

  //入力されたパスワードをステート保存
  void _setPassword(String password){
    setState(() {
      newPassword = password;
    });
  } 
  
  //入力されたemailバリデーションチェック結果を保存
  void _setIsValidEmail(bool isVaild){
    setState(() {
      _isValidEmail = isVaild;
    });
  }

  //入力されたemailバリデーションチェック結果を保存
  void _setIsValidPassword(bool isVaild){
    setState(() {
      _isValidPassword = isVaild;
    });
  }

  //全てのバリデーションチェックの結果を返す
  bool _isAllValid(){
    return _isValidEmail && _isValidPassword;
  }
  
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
// Googleアカウントの表示名
  String _displayName = "";
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
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
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(100.0.h),
          child:Padding(
            padding: EdgeInsets.only(top: 50.h),
            child:  AppBar(
              
            title: 
              BorderedText(
                child: Text(
                "メールアドレスでログイン",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,//背景色を透明にする
            elevation: 0,  //影をなくす,
            leading:  IconButton(
              onPressed:(){
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 14.w,
              ),
            ),
          ),
          )
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 41.h, bottom: 20.h),
                child: TextFormField_Component_Validator(
                labelText: "メールアドレス", 
                height: 45, 
                width: 250, 
                controller: email_controller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  EmailValidator(),
                ], 
                onChage: _setEmail, 
                setIsValid: _setIsValidEmail,
                ),
              ),
              Padding(
                padding: EdgeInsets.only( bottom: 40.h),
                child: TextFormField_Component_Validator(
                labelText: "パスワード", 
                height: 45, 
                width: 250, 
                controller: password_controller, 
                obscuretext: false, 
                validators: [
                  RequiredValidator(),
                  PasswordValidator(),
                ], 
                setIsValid: _setIsValidPassword, 
                onChage: _setPassword,
                ),
              ),
              TextButton(
                style:TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(50.w, 32.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ) 
                ),
                child:BorderedText(
                  child:  Text(
                  "ログイン",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: _isAllValid() 
                ? (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailLoginPage()));
                }: null
              ),
            ],
          ),
        ),
      ),
    );
  }
}



