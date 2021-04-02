import 'package:app_de_noticias/src/pages/home.dart';
import 'package:app_de_noticias/src/pages/login.dart';
import 'package:app_de_noticias/src/pages/sign_in.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        'login':(_)=>LoginPage(),
        'signin':(_)=>SigninPage(),
        'home':(_)=>HomePage()
      },
      initialRoute: 'login',
    );
  }
}