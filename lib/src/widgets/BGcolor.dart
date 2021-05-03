import 'package:flutter/material.dart';

class BGColor extends StatelessWidget {
  static const decor = BoxDecoration(
      gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                  Color(0XFFFCBB6D),
                  Color(0XFFB46D7E),
                  Color(0XFF94687D),
                  Color(0XFF71637B),
                  Color(0XFF475C7A),
            ]),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}