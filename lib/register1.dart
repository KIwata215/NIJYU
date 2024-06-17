import 'package:flutter/material.dart';


class register1 extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにするための設定
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 30.0, right: 30.0),
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
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('ページネーション')
                      ],
                    )),
                SizedBox(height: 20),
                Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LabelContainer(labelText: '名前'), // LabelContainerクラスを使用
                    Container(
                        width:
                            MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ))),
                    LabelContainer(
                        labelText: 'メールアドレス'), // LabelContainerクラスを使用
                    Container(
                        width:
                            MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ))),
                    LabelContainer(labelText: '電話暗号'), // LabelContainerクラスを使用
                    Container(
                        width:
                            MediaQuery.of(context).size.width * 0.6, // 画面幅の60%
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
                    padding:
                        EdgeInsets.only(top: 20.0, bottom: 20.0, right: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
