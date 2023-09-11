import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {


   const MyRichText({super.key,required this.widgets, required this.marginLeft});

   final List<Widget> widgets;
   final double marginLeft;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: marginLeft),
      child:  IntrinsicHeight(
          child: Row(
              children: widgets
          )
      )
    );
  }
}
