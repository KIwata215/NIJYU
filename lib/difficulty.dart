import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nijyu/constants/colors.dart';

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

class _DifficultyPageState extends State<DifficultyPage> {
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

    List<bool> _isChecked = List<bool>.filled(9, false);

    int _countSelected() {
      return _isChecked.where((item) => item).length;
    }

    //難易度選択用のメソッド
    // void _selectDifficulty(String difficulty) {
    //   setState(() {
    //     _selectedDifficulty = difficulty;
    //   });
    // }


  @override
  Widget build(BuildContext context) {
    List<String> items = _difficultyImages[_selectedDifficulty]!;
    int _maxSelection = _selectedGameRound;
    int _selectedCount = 0;
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
                  'ゲーム数とマップを選択してね',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white, // テキストの色
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 70.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.w,), 
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
                              color: _selectedGameRound == index + 1 ? Colors.yellow : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: _selectedGameRound == number ? 14.sp : 10.sp,
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
                    SizedBox(width: 10.w,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 450.0.h,
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  aspectRatio: 4/3,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
              items: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;
                  return Container(
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text(
                            'マップ ${index + 1}', // インデックス + 1を表示
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.black54,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            _isChecked[index] ? Icons.check_circle_outline : null,
                            color: Colors.blue[700],
                            size: 60.h,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h,),

            // (_countSelected() >= _selectedGameRound) ? Text("ゲーム数の数だけマップを選択できます。",
            //                                                   style: TextStyle(color: Colors.red,
            //                                                                    fontSize: 6.sp,
            //                                                   ),)
            //                                          : Text(""),

            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_isChecked.length, (index) {
                    return Row(
                      children: [
                        Checkbox(
                          value:  _isChecked[index] == false && _countSelected() >= _selectedGameRound ? null 
                                                                                                       : _isChecked[index],
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked[index] = value ?? false;
                              _selectedCount = _isChecked.where((item) => item).length;
                            });
                          },
                          tristate: true,
                          fillColor: _isChecked[index] == false && _countSelected() >= _selectedGameRound ? MaterialStateProperty.resolveWith((states) => Colors.red[200])
                                                                                                          : MaterialStateProperty.resolveWith((states) => Colors.blue[200]),
                        ),
                        Text('マップ ${index + 1}｜'),
                      ],
                    );
                  },
                  )
                ),
              ),
            ),

            //---------------難易度のコードここから---------------
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
            //---------------難易度のコードここまで---------------

            Padding(
              padding: EdgeInsets.only(right: 70.0), //画面右からのパディング
              child: Align(
                alignment: Alignment.bottomRight, //右下に配置
                child:SizedBox(
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
              )
            ),
            SizedBox(height:20.h),
          ]
        ),
      ),
    );
  }
}

// Container(
//   child: CheckboxListTile(
//     secondary: Image.asset('assets/images/easy1.jpg'),
//     value: _isChecked,
//     onChanged: (bool? value) {
//       setState(() {
//         _isChecked = value ?? true;
//       });
//     },
//   ),
// ) 