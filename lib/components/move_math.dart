import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nijyu/constants/colors.dart';
import 'package:nijyu/constants/times.dart';
import 'package:nijyu/providers/sugoroku_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoveMath extends StatefulWidget {
  const MoveMath({Key? key}) : super(key: key);

  @override
  _MoveMathState createState() => _MoveMathState();
}

class _MoveMathState extends State<MoveMath>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  bool _isAnimationCompleted = false; // マスアニメーション管理フラグ

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
          milliseconds: AnimationTimes.animationDurationMillis), // 3秒かけて動かす
      vsync: this,
    );

    // アニメーションの開始位置と終了位置設定
    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // アニメーションを滑らかに
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    final currentPlayer = playerProvider.currentPlayer;
    // デバッグ用に currentPlayer.playerImages を出力して値を確認する
    print("Current Player Images: ${currentPlayer.playerImages}");
    return Consumer<MoveMathProvider>(
      builder: (context, moveMathProvider, child) {
        double newPosition =
            moveMathProvider.currentPosition.toDouble() * -300.h;
        _positionAnimation = Tween<double>(
          begin: _positionAnimation.value,
          end: newPosition,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );

        // アニメーションが完了していない場合にのみアニメーションを実行
        if (!_isAnimationCompleted) {
          print('マスが動きます');
          _controller.forward();
          _isAnimationCompleted = true;
        } else {
          _isAnimationCompleted = false;
        }

        return Stack(
          children: [
            AnimatedBuilder(
              animation: _positionAnimation,
              builder: (context, child) {
                return Positioned(
                  bottom: _positionAnimation.value,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: List.generate(10, (index) {
                      double width = 300.w;
                      double height = 280.h;
                      return Stack(
                        children: [
                          Column(
                            children: [
                              ClipPath(
                                clipper: TrapezoidClipper(),
                                child: Container(
                                    width: width,
                                    height: height,
                                    color: Color(0xFFFFE86D).withOpacity(0.7)),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                );
              },
            ),
            Positioned(
              top: -20,
              left: -170,
              child: Transform.rotate(
                angle: 5 * pi / 180,
                child: Container(
                  height: 600, // 縦線の高さを指定
                  width: 200, // 縦線の太さを指定
                  color: colors.sugorokuBackgroundNavy,
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 285,
              child: Transform.rotate(
                angle: -5 * pi / 180,
                child: Container(
                  height: 600, // 縦線の高さを指定
                  width: 200, // 縦線の太さを指定
                  color: colors.sugorokuBackgroundNavy,
                ),
              ),
            ),
            Positioned(
              top: -80.h, // 画像の高さの半分だけずらして中央に配置
              left: -260.w, // 画像の幅の半分だけずらして中央に配置
              child: Image.asset(
                currentPlayer.playerImages, // あなたの画像のパス
                width: 650.w,
                height: 650.h,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.08, 0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.92, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
