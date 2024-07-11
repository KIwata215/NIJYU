import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nijyu/providers/sugoroku_provider.dart';
import 'package:provider/provider.dart';

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
      home: const DifficultyPage(),
    );
  }
}

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({super.key});

  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage>
    with SingleTickerProviderStateMixin {
  int _selectedGameRound = 1;
  String _selectedDifficulty = 'EASY';
  final Map<String, List<String>> _difficultyImages = {
    'EASY': [
      'assets/images/easy1.jpg',
      'assets/images/easy2.jpg',
      'assets/images/easy3.jpg',
      'assets/images/normal1.jpg',
      'assets/images/normal2.jpg',
      'assets/images/normal3.jpg',
      'assets/images/hard1.jpg',
      'assets/images/hard2.jpg',
      'assets/images/hard3.jpg',
    ],
    // 'NORMAL': [
    //   'assets/images/normal1.jpg',
    //   'assets/images/normal2.jpg',
    //   'assets/images/normal3.jpg',
    // ],
    // 'HARD': [
    //   'assets/images/hard1.jpg',
    //   'assets/images/hard2.jpg',
    //   'assets/images/hard3.jpg',
    // ],
  };

  List<bool> _mapSelect = [
    false, false, false, false, false, false, false, false, false //画像9枚分
  ];

  void _selectDifficulty(String difficulty) {
    setState(() {
      _selectedDifficulty = difficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final roundProvider = Provider.of<RoundProvider>(context);
    return Consumer<RoundProvider>(
      builder: (context, RoundProvider, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(children: [
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
                      'ゲーム数とマップを選択してね',
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
                height: 70.h,
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
                        'ゲーム数',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white, // テキストの色
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 10.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          int number = index + 1;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGameRound = index + 1;
                              });
                            },
                            child: Container(
                              width: 20.w,
                              height: 60.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _selectedGameRound == index + 1
                                    ? Colors.yellow
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: _selectedGameRound == number
                                      ? 14.sp
                                      : 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: _selectedGameRound == index + 1
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
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 450.0.h,
                    viewportFraction: 0.5,
                    // autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 4 / 3,
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                  items: _difficultyImages[_selectedDifficulty]!
                      .map((item) => Container(
                            child: Center(
                                child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            )),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              Text('$_mapSelect'),

              SizedBox(
                height: 60.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    _mapSelect.length,
                    (index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _mapSelect[index],
                            onChanged: (bool? value) {
                              setState(() {
                                _mapSelect[index] = value ?? false;
                              });
                            },
                          ),
                          Text('Item ${index + 1}'),
                        ],
                      );
                    },
                  )),
                ),
              ),

              // SizedBox(
              //   height: 60.h,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.blue[900],
              //       borderRadius: BorderRadius.circular(50)
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(width: 10.w,),
              //         Text(
              //             '難易度',
              //             style: TextStyle(
              //               fontSize: 8.sp,
              //               color: Colors.white, // テキストの色
              //               fontWeight: FontWeight.bold,
              //             ),
              //             textAlign: TextAlign.center,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: List.generate(3, (index) {
              //             final difficulties = ['EASY', 'NORMAL', 'HARD'];
              //             return GestureDetector(
              //               onTap: () {
              //                 setState(() {
              //                   _selectedDifficulty = difficulties[index];
              //                 });
              //               },
              //               child: Container(
              //                 width: 40.w,
              //                 height: 60.h,
              //                 alignment: Alignment.center,
              //                 decoration: BoxDecoration(
              //                   color: _selectedDifficulty == difficulties[index] ? Colors.yellow : Colors.transparent,
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: Text(
              //                   '${difficulties[index]}',
              //                   style: TextStyle(
              //                     fontSize: _selectedDifficulty == difficulties[index] ? 8.sp : 6.sp,
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     shadows: _selectedDifficulty == difficulties[index]
              //                         ? [
              //                             Shadow(
              //                               offset: Offset(1.0, 1.0),
              //                               blurRadius: 3.0,
              //                               color: Colors.black,
              //                             ),
              //                           ]
              //                         : null,
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                  padding: EdgeInsets.only(right: 70.0), //画面右からのパディング
                  child: Align(
                    alignment: Alignment.bottomRight, //右下に配置
                    child: SizedBox(
                      width: 160.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // 次の画面に遷移
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => NextPage()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200], // ボタンの背景色
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // 角を少し丸くする
                          ),
                        ),
                        child: BorderedText(
                          strokeWidth: 1.0.sp, // 縁の太さ
                          strokeColor: Colors.black, // 縁の色
                          child: Text(
                            '始める',
                            style: TextStyle(
                              fontSize: 7.sp,
                              color: Colors.white, // テキストの色
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 20.h),
            ]),
          ),
        );
      },
    );
  }
}
