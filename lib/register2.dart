import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Register2Page(),
    );
  }
}

class Register2Page extends StatefulWidget {
  const Register2Page({super.key});

  @override
  State<Register2Page> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register2Page> {
  final _formKey = GlobalKey<FormState>();
  String year = '';
  String month = '';
  String day = '';
  String password = '';
  String confirmPassword = '';

  //パスワード用コントローラー
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // キーボードを閉じる
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Image.asset('assets/images/flow2.png', height: 50.h),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 200.0).copyWith(bottom: bottomSpace),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: BorderedText(
                            strokeWidth: 2.0.sp, // 縁の太さ
                            strokeColor: Colors.black, // 縁の色
                            child: Text(
                              'アカウント新規登録',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white, // テキストの色
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: BorderedText(
                            strokeWidth: 1.0.sp, // 縁の太さ
                            strokeColor: Colors.black, // 縁の色
                            child: Text(
                              '生年月日',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0), // フィールド間のパディング
                                child: SizedBox(
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '年',
                                      labelStyle: TextStyle(color: Colors.black26),
                                      fillColor: Colors.blueGrey[50], // 背景色の変更
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '年を入力してください';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      year = value ?? '';
                                    },
                                  ),
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0), // フィールド間のパディング
                                child: SizedBox(////エラーメッセージバグ
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '月',
                                      labelStyle: TextStyle(color: Colors.black26),
                                      fillColor: Colors.blueGrey[50], // 背景色の変更
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      SizedBox(height: 20.h,);
                                      if (value == null || value.isEmpty) {
                                        return '月を入力してください';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      month = value ?? '';
                                    },
                                  ),
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0), // フィールド間のパディング
                                child: SizedBox(
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '日',
                                      labelStyle: TextStyle(color: Colors.black26),
                                      fillColor: Colors.blueGrey[50], // 背景色の変更
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '日を入力してください';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      day = value ?? '';
                                    },
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: BorderedText(
                            strokeWidth: 1.0.sp, // 縁の太さ
                            strokeColor: Colors.black, // 縁の色
                            child: Text(
                              'パスワード',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'パスワード',
                              labelStyle: TextStyle(color: Colors.black26),
                              fillColor: Colors.blueGrey[50], // 背景色の変更
                              filled: true,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'パスワードを入力してください';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value ?? '';
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: BorderedText(
                            strokeWidth: 1.0.sp, // 縁の太さ
                            strokeColor: Colors.black, // 縁の色
                            child: Text(
                              'パスワード(確認用)',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'パスワード(確認)',
                              labelStyle: TextStyle(color: Colors.black26),
                              fillColor: Colors.blueGrey[50], // 背景色の変更
                              filled: true,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'パスワード(確認)を入力してください';
                              }
                              if (value != _passwordController.text) {
                                return 'パスワードが一致しません';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              confirmPassword = value ?? '';
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 70.0), //画面右からのパディング
                child: Align(
                  alignment: Alignment.bottomRight, //右下に配置
                  child:SizedBox(
                    width: 120.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // 次の画面に遷移
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => NextPage()),
                          // );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // ボタンの背景色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 角を少し丸くする
                        ),
                      ),
                      child: BorderedText(
                        strokeWidth: 1.0.sp, // 縁の太さ
                        strokeColor: Colors.black, // 縁の色
                        child: Text(
                          '次へ',
                          style: TextStyle(
                            fontSize: 7.sp,
                            color: Colors.white, // テキストの色
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: 15.h,)
            ],
          ),
        ),
      ),
    );
  }
}
