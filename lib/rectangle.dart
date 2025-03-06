import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;

  const Rectangle({
    Key? key,
    required this.width,
    required this.height,
    this.color = Colors.blue,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}