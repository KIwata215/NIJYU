import 'package:flutter/material.dart';

class Register1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにするための設定
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 10.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        '新規アカウント登録',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('ページネーション')
                    ],
                  )),
              // SizedBox(height: 10),
              Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LabelContainer(labelText: '名前'), // LabelContainerクラスを使用
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                      // padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ))),
                  LabelContainer(labelText: 'メールアドレス'), // LabelContainerクラスを使用
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                      // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ))),
                  LabelContainer(labelText: '電話暗号'), // LabelContainerクラスを使用
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                      // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ))),
                ],
              )),
              Padding(
                  padding: EdgeInsets.only(top: 0.0, bottom: 20.0, right: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register1_page2()));
                        },
                        child: const Text("次へ"),
                      ),
                    ],
                  ))
            ]),
      ),
    );
  }
}

class LabelContainer extends StatelessWidget {
  final String labelText;

  LabelContainer({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------
// 新規登録2ページ目

class Register1_page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにするための設定
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      '新規アカウント登録',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('ページネーション')
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '年',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),

                    // フィールド間のパディング
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0), // フィールド間のパディング
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '月',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0), // フィールド間のパディング
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '日',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  fillColor: Colors.white12, // 背景色の変更
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード(確認)',
                  fillColor: Colors.white12, // 背景色の変更
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 0, right: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register1_page3()));
                      },
                      child: const Text("次へ"),
                    ),
                  ],
                ))
          ]),
    ));
  }
}
//-----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// 新規登録3ページ目

class Register1_page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにするための設定
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      '新規アカウント登録',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('ページネーション')
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                LabelContainer(labelText: 'お酒を飲むのは好きですか？'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '年',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),

                    // フィールド間のパディング
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0), // フィールド間のパディング
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '月',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0), // フィールド間のパディング
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: '日',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  fillColor: Colors.white12, // 背景色の変更
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード(確認)',
                  fillColor: Colors.white12, // 背景色の変更
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 0, right: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register1_page2()));
                      },
                      child: const Text("次へ"),
                    ),
                  ],
                ))
          ]),
    ));
  }
}
