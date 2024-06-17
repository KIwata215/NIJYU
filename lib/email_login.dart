import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:bordered_text/bordered_text.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nijyu/login.dart';
import 'package:nijyu/test_nextPage.dart';


class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPage();
}

class _EmailLoginPage extends State<EmailLoginPage> {
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
              Text(
                "メールアドレスでログイン",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
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
                child: _TextFormField(
                labelText: "メールアドレス", 
                height: 45, 
                width: 250, 
                controller: email_controller, 
                obscuretext: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only( bottom: 40.h),
                child: _TextFormField(
                labelText: "パスワード", 
                height: 45, 
                width: 250, 
                controller: password_controller, 
                obscuretext: false,
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
                child: Text(
                  "ログイン",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailLoginPage()));
                  },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _TextFormField extends StatelessWidget {
  final String labelText;
  final double height;
  final double width;
  final TextEditingController controller;
  final bool obscuretext;
  _TextFormField(
      {required this.labelText,
      required this.height,
      required this.width,
      required this.controller,
      required this.obscuretext
      }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 8.sp,
            color: Colors.white
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: height.h, // 高さの変更
          width: width.w, // 横幅の変更
          child: TextFormField(
            controller: controller,
            obscureText: obscuretext,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10) //外側の丸み
                ),
            ),
          ),
        ),
      ],
    );
  }
}