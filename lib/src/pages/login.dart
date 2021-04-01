import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
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
      ),
      child: Column(
        children: [
          SizedBox(height: 180),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            //padding:EdgeInsets.symmetric(horizontal:120) ,
            child: Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0XFFFCBB6D),
                    ]),
              ),
              child: Center(child: Text('Login')),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Eres nuevo?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              CupertinoButton(
                  child: Text(
                    'Regístrate',
                    style: TextStyle(color: Color(0XFFFCBB6D)),
                  ),
                  onPressed: () {})
            ],
          )
        ],
      ),
    ));
  }
}
