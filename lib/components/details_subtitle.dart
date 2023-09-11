import 'package:flutter/material.dart';

class DetailsSubtitle extends StatelessWidget {
  const DetailsSubtitle({super.key, required this.title, required this.marginLeft});

  final String title;
  final double marginLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: marginLeft),
      child:  Wrap(
        children: [
          Text(title,style: const TextStyle(fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}
