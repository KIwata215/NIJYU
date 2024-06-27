import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nijyu/components/event_dialog.dart';
import 'package:nijyu/constants/times.dart';
import 'package:nijyu/providers/player_provider.dart';
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
  bool _showDialogAfterAnimation = false;

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
        _controller.forward();

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
                                  color: Colors.blue,
                                ),
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
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 300,
              child: Transform.rotate(
                angle: -5 * pi / 180,
                child: Container(
                  height: 600, // 縦線の高さを指定
                  width: 200, // 縦線の太さを指定
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 50, // 画像の高さの半分だけずらして中央に配置
              left: -150, // 画像の幅の半分だけずらして中央に配置
              child: Image.asset(
                'assets/dice_images/vector.png', // あなたの画像のパス
                width: 650,
                height: 650,
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
