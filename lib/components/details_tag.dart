import 'package:flutter/material.dart';

class MyDetailsTag extends StatelessWidget {
  const MyDetailsTag({super.key, required this.title, required this.marginLeft});

  final String title;
  final double marginLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: marginLeft),
      child:  Container(
        decoration: BoxDecoration(
          color: const Color(0xFF106510),
          borderRadius: BorderRadius.circular(10.0), // 圆角半径
        ),
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child:  Text(
          title,
          style: const TextStyle(color: Colors.white,fontSize: 14.0),
        ),
      ),
    );

  }
}
