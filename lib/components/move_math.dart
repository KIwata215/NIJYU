import 'dart:math';
import 'package:flutter/material.dart';

class MoveMath extends StatefulWidget {
  const MoveMath({Key? key}) : super(key: key);

  @override
  _MoveMathState createState() => _MoveMathState();
}

class _MoveMathState extends State<MoveMath>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  int _currentPosition = 0;
  final int totalSteps = 10; // マスの数

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

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

  void _moveBoard(int steps) {
    setState(() {
      _currentPosition = steps;
      double newPosition = _currentPosition.toDouble() * -100;
      _positionAnimation = Tween<double>(
        begin: _positionAnimation.value,
        end: newPosition - 200,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ),
      );
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugoroku Game'),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _positionAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: _positionAnimation.value,
                left: 0,
                right: 0,
                child: Column(
                  children: List.generate(totalSteps, (index) {
                    double width = 150 + (index * 20);
                    double height = 100 + (index * 20);
                    return Stack(
                      children: [
                        Column(
                          children: [
                            ClipPath(
                              clipper: TrapezoidClipper(),
                              child: Container(
                                width: width,
                                height: height,
                                color: Colors
                                    .primaries[index % Colors.primaries.length],
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
            left: 70,
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
            left: 500,
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
            left: 50, // 画像の幅の半分だけずらして中央に配置
            child: Image.asset(
              'assets/images/vector.png', // あなたの画像のパス
              width: 650,
              height: 650,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int randomSteps = Random().nextInt(6) + 1; // 1から6までのランダムな数
          _moveBoard(randomSteps); // ランダムな数のステップでマスを進む
          print(randomSteps);
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
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
