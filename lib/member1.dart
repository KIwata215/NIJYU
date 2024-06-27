import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/constants/player.dart';

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
      home: const Member1Page(),
    );
  }
}

class Member1Page extends StatefulWidget {
  const Member1Page({super.key});

  @override
  State<Member1Page> createState() => _Member1PageState();
}

class _Member1PageState extends State<Member1Page> {
  int _selectedParticipants = 4;
  List<String> _isSelectedValue = ["", "", "", "", "", ""]; //選択したお酒のカテゴリ

  @override
  Widget build(BuildContext context) {
    const designSize = Size(393, 852);
    return ScreenUtilInit(
        //元となる画面サイズ（iphone15)
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Scaffold(
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
                    centerTitle: true,
                    title: BorderedText(
                        strokeWidth: 2.0.sp, // 縁の太さ
                        strokeColor: Colors.black, // 縁の色
                        child: Text(
                          '参加人数を選択してね',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white, // テキストの色
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 80.h,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '参加人数',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              int number = index + 2;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedParticipants = index + 2;
                                  });
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 60.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedParticipants == index + 2
                                        ? Colors.yellow
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${index + 2}',
                                    style: TextStyle(
                                      fontSize: _selectedParticipants == number
                                          ? 18.sp
                                          : 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows:
                                          _selectedParticipants == index + 2
                                              ? [
                                                  Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 3.0,
                                                    color: Colors.black,
                                                  ),
                                                ]
                                              : null,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 20.w,
                    runSpacing: 20.h,
                    children: List.generate(_selectedParticipants, (index) {
                      return Column(
                        children: [
                          Icon(
                            Icons.person,
                            size: 40.sp,
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 45.w,
                            height: 60.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: '4文字以内',
                                labelStyle: TextStyle(
                                    fontSize: 6.sp, color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                              ),
                              maxLength: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 46.w,
                            height: 50.h,
                            child: DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  value: '',
                                  child: Text(
                                    'カテゴリから選択',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '日本酒',
                                  child: Text('日本酒'),
                                ),
                                DropdownMenuItem(
                                  value: 'ビール',
                                  child: Text('ビール'),
                                ),
                                DropdownMenuItem(
                                  value: 'ハイボール',
                                  child: Text('ハイボール'),
                                ),
                              ],
                              value: _isSelectedValue[index],
                              onChanged: (String? value) {
                                setState(() {
                                  _isSelectedValue[index] = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  // SizedBox(height: 20.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: List.generate(_selectedParticipants, (index) {
                  //     return Column(
                  //       children: [
                  //         Icon(Icons.person, size: 40.sp, color: Colors.primaries[index % Colors.primaries.length]),
                  //         SizedBox(height: 10.h),
                  //         SizedBox(
                  //           width: 100.w,
                  //           child: TextFormField(
                  //             decoration: InputDecoration(
                  //               labelText: '全角8文字以内',
                  //               labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                  //               filled: true,
                  //               fillColor: Colors.white,
                  //               border: OutlineInputBorder(),
                  //             ),
                  //             maxLength: 8,
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   }),
                  // ),
                  SizedBox(height: 20.h),
                  Padding(
                      padding: EdgeInsets.only(right: 70.0), //画面右からのパディング
                      child: Align(
                        alignment: Alignment.bottomRight, //右下に配置
                        child: SizedBox(
                          width: 120.h,
                          child: ElevatedButton(
                            onPressed: () {
                              // 次の画面に遷移
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NextPage()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // ボタンの背景色
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5), // 角を少し丸くする
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
                      )),
                ],
              ),
            ),
          );
        });
  }
}
