import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:bordered_text/bordered_text.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nijyu/component/buttton.dart';
import 'package:nijyu/email_login.dart';
import 'package:nijyu/test_nextPage.dart';


class Login extends StatefulWidget {

  @override
  State<Login> createState() => Loginpage();
}

class Loginpage extends State<Login> {

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0.h),
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
              color: Colors.white
              ),
              centerTitle: true,
              title: BorderedText(
                strokeWidth: 3.0.sp, // 縁の太さ
                strokeColor: Colors.black, // 縁の色
                child: Text(
                  "ログイン",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white, // テキストの色
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            )
          ),
       ),
        backgroundColor: Colors.transparent, // 背景色を透明にする
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40.h,),
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
                padding: EdgeInsets.only(bottom: 30.h),
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
                            builder: (context) => EmailLoginPage()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/Mailicon.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Button(
                  height: 45,
                  width: 400,
                  backgroundColor: Colors.white,
                  text: 'Google',
                  textColor: Colors.black,
                  onpress: () async {
                    // Google認証
                    GoogleSignInAccount? signinAccount = await googleLogin.signIn();
                    if (signinAccount == null) return;
                    GoogleSignInAuthentication auth =
                        await signinAccount.authentication;
                    final OAuthCredential credential = GoogleAuthProvider.credential(
                      idToken: auth.idToken,
                      accessToken: auth.accessToken,
                    );
                    // User? user =
                    //   (await FirebaseAuth.instance.signInWithCredential(credential)).user;
                    // if (user != null) {
                    //   setState(() {
                    //     // 画面を更新
                    //     _displayName = user.displayName!;
                    //   });
                    // }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => test_nextPage()));
                  },
                  iconheight: 75.h,
                  iconwidth: 75.h,
                  image: 'assets/images/Googleicon.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



