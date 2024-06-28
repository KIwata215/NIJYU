import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/constants/player.dart';
import 'package:nijyu/providers/player_provider.dart';
import 'package:nijyu/views/rule_screen.dart';
import 'package:nijyu/views/sugoroku_screen.dart';
import 'package:provider/provider.dart';

class MemberSelectScreen extends StatefulWidget {
  const MemberSelectScreen({super.key});

  @override
  State<MemberSelectScreen> createState() => _MemberSelectScreen();
}

class _MemberSelectScreen extends State<MemberSelectScreen> {
  int _selectedParticipants = 4;
  List<Player> _players = List.generate(6,
      (index) => Player(name: "", category: "", score: 0, remainingMath: 30));

  @override
  Widget build(BuildContext context) {
    const designSize = Size(393, 852);
    return ScreenUtilInit(
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
                    strokeWidth: 2.0.sp,
                    strokeColor: Colors.black,
                    child: Text(
                      '参加人数を選択してね!!!!!!!!',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 80.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
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
                        ),
                        SizedBox(width: 10.w),
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
                          color:
                              Colors.primaries[index % Colors.primaries.length],
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 45.w,
                          height: 60.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '4文字以内',
                              labelStyle: TextStyle(
                                fontSize: 6.sp,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            maxLength: 4,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _players[index].name = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 46.w,
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
                    );
                  }),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 120.h,
                      child: ElevatedButton(
                        onPressed: () {
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
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: BorderedText(
                          strokeWidth: 1.0.sp,
                          strokeColor: Colors.black,
                          child: Text(
                            '次へ',
                            style: TextStyle(
                              fontSize: 7.sp,
                              color: Colors.white,
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
        );
      },
    );
  }
}
