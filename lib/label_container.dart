import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  final String labelText;

  LabelContainer({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
