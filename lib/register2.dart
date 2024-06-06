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
  // final String title;

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
    return MaterialApp(
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("アカウント新規登録"),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0), // 左右のパディング
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0), // フィールド間のパディング
                        child: TextFormField(
                          decoration: InputDecoration(labelText: '年'),
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
                          decoration: InputDecoration(labelText: '月'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '月を入力してください';
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
                        padding: const EdgeInsets.only(left: 30.0), // フィールド間のパディング
                        child: TextFormField(
                          decoration: InputDecoration(labelText: '日'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '日を入力してください';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            year = value ?? '';
                          },
                        ),
                      ),
                    ),
                  ]
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'パスワード'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワードを入力してください';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    year = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'パスワード(確認)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワード(確認)を入力してください';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    year = value ?? '';
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // 次の画面に遷移
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ///NextPage///()),
                        // );
                      }
                    },
                    child: Text("次へ"),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
