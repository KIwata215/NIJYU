import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/components/move_math.dart';
import 'package:nijyu/components/player_info.dart';
import 'package:nijyu/components/sgoroku.dart';
import 'package:nijyu/constants/player.dart';
import 'package:nijyu/providers/player_provider.dart';
import 'package:provider/provider.dart';

void main() {
  //画面横向き固定
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const designSize = Size(393, 852);
    return ScreenUtilInit(
      //元となる画面サイズ（iphone15)
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        // provider適用(仮)
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PlayerProvider()),
            ChangeNotifierProvider(create: (_) => MoveMathProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: MoveMathScreen(),
            title: 'LoginPage',
          ),
        );
      },
    );
  }
}

class MoveMathScreen extends StatelessWidget {
  const MoveMathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    final players = playerProvider.players;
    final currentPlayer = playerProvider.currentPlayer;
    return Scaffold(
      body: Row(children: [
        Expanded(
          flex: 2,
          child: MoveMath(),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        Expanded(
          flex: 2,
          child: SugorokuGame(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                '現在のプレイヤー: ${currentPlayer.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...players.map((player) => PlayerInfo(player: player)).toList(),
            ],
          ),
        ),
        // Text(
        //   "参加人数: ${players.length}",
        //   style: TextStyle(),
        // )
        //   ],
        // ),
      ]),
    );
  }
}
