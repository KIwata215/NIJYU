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
        ////////グラデーション
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     stops: [0.1, 0.9],
        //     colors: [
        //       Color.fromRGBO(64, 129, 137, 1), // グラデーションの開始色
        //       Color.fromRGBO(92, 160, 128, 1), // グラデーションの終了色
        //     ],
        //   ),
        // ),
        child: Scaffold(
          body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.purple, Colors.blue],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
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
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: '月'),
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
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: '日'),
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
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード（確認用）'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '確認用パスワードを入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  confirmPassword = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
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
                child: Text('次へ'),
              ),
            ],
          ),
        ),
      ),
        ),
      ),
    );
  }
}
