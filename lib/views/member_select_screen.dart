import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/constants/player.dart';
import 'package:nijyu/providers/player_provider.dart';
import 'package:nijyu/views/rule_screen.dart';
import 'package:provider/provider.dart';

class MemberSelectScreen extends StatefulWidget {
  const MemberSelectScreen({super.key});

  @override
  State<MemberSelectScreen> createState() => _MemberSelectScreen();
}

class _MemberSelectScreen extends State<MemberSelectScreen> {
  int _selectedParticipants = 4;
  List<Player> _players = List.generate(
      6,
      (index) => Player(
          name: "", category: "", score: 0, remainingMath: 30, plusscore: 40));
  
  //名前・カテゴリが入力されていないときに出す警告文字のフラグ
  bool _showWarning = false;

//カテゴリと名前が入力されているのかチェックしている
  bool _validateInputs() {
    for (int i = 0; i < _selectedParticipants; i++) {
      if (_players[i].name.isEmpty || _players[i].category.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    const designSize = Size(393, 852);
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: BorderedText(
                child: Text(
                  "参加人数を選択してね！",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    
                    Container(
                      height: 70.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10.w)),
                          Text(
                            "参加人数",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(width: 5.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              int number = index + 2;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedParticipants = number;
                                  });
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 60.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedParticipants == number
                                        ? Colors.yellow
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '$number',
                                    style: TextStyle(
                                      fontSize: _selectedParticipants == number
                                          ? 18.sp
                                          : 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: _selectedParticipants == number
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
                          )
                        ],
                      ),
                    ),
                    if (_showWarning)
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "全てのプレイヤーの名前とカテゴリを入力してください。",
                          style: TextStyle(color: Colors.red, fontSize: 10.sp),
                        ),
                      ),
                    
                    Column(
                      children: [
                        Wrap(
                          spacing: 20.w,
                          runSpacing: 20.h,
                          children: List.generate(
                            _selectedParticipants,
                            (index) {
                              return _buildPlayerInput(index);
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(right: 70.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 60.w,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_validateInputs()) {
                                Provider.of<PlayerProvider>(context, listen: false)
                                    .setPlayers(_players
                                        .take(_selectedParticipants)
                                        .toList());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RuleScreen(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  _showWarning = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xff43BBEF),
                                      Color(0xffA1C7D7),
                                    ] ,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: BorderedText(
                                    strokeWidth: 3.0.sp,
                                    strokeColor: Colors.white,
                                    child: Text(
                                      '次へ',
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlayerInput(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: 40.sp,
            color: Colors.primaries[index % Colors.primaries.length],
          ),
          SizedBox(
            width: 55.w,
            height: 65.h,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '全角8文字以内',
                labelStyle: TextStyle(
                  fontSize: 6.sp,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.w), 
              ),
              maxLength: 8,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 6.sp
              ),
              onChanged: (value) {
                _players[index].name = value;
              },
            ),
          ),
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: DropdownButton<String>(
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
              value: _players[index].category,
              onChanged: (String? value) {
                setState(() {
                  _players[index].category = value ?? '';
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
