import 'package:flutter/material.dart';

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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0).copyWith(bottom: bottomSpace),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Center(
                            child: Text("アカウント新規登録"),
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily: 'Zenkaku',
                            fontWeight: FontWeight.w700,
                          ),
                          
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0), // フィールド間のパディング
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: '年',
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
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0), // フィールド間のパディング
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: '月',
                                    fillColor: Colors.blueGrey[50], // 背景色の変更
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '月を入力してください';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    month = value ?? '';
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0), // フィールド間のパディング
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: '日',
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
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'パスワード',
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
                        SizedBox(height: 30.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'パスワード(確認)',
                            fillColor: Colors.blueGrey[50], // 背景色の変更
                            filled: true,
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'パスワード(確認)を入力してください';
                            }
                            if (value != password) {
                              return 'パスワードが一致しません';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            confirmPassword = value ?? '';
                          },
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.bottomRight,
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
                            child: Text("次へ"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
