import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Walking Animation Example'),
        ),
        body: WalkingAnimation(),
      ),
    );
  }
}

class WalkingAnimation extends StatefulWidget {
  @override
  _WalkingAnimationState createState() => _WalkingAnimationState();
}

class _WalkingAnimationState extends State<WalkingAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationPosition;
  late Animation<double> _animationScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animationPosition = Tween<Offset>(
      begin: Offset(0, -1.0), // スクリーンの上から開始
      end: Offset(0, 1.0), // スクリーンの下で終了
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _animationScale = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRectangle(Color color) {
    return ScaleTransition(
      scale: _animationScale,
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _animationPosition,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRectangle(Colors.red),
            SizedBox(height: 20),
            _buildRectangle(Colors.green),
            SizedBox(height: 20),
            _buildRectangle(Colors.blue),
          ],
        ),
      ),
    );
  }
}
