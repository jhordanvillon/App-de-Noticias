import 'package:flutter/material.dart';

class CampoDato extends StatelessWidget {
  final String placeholder;
  final double margin;
  const CampoDato({Key key, this.placeholder,this.margin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container( 
            padding: EdgeInsets.symmetric(horizontal: margin),
            child: TextField(
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