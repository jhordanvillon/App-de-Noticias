import 'package:flutter/material.dart';

class CampoDato extends StatelessWidget {
  final String placeholder;
  final double margin;
  final TextEditingController controller;
  const CampoDato({Key key, this.placeholder,this.margin,this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container( 
            padding: EdgeInsets.symmetric(horizontal: margin),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          );
  }
}