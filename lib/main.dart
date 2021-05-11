import 'package:app_de_noticias/src/pages/home.dart';
import 'package:app_de_noticias/src/pages/login.dart';
import 'package:app_de_noticias/src/pages/sign_in.dart';
import 'package:app_de_noticias/src/pages/splash.dart';
import 'package:flutter/material.dart';

import 'src/pages/crear_noticias.dart';
import 'src/pages/perfil.dart';
import 'src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: miTema,
      routes: {
        'login':(_)=>LoginPage(),
        'signin':(_)=>SigninPage(),
        'home':(_)=>HomePage(),
        'crear_noticia':(_)=>CrearNoticia(),
        'perfil':(_)=>Perfil()
      },
      home: SplashHomePage(),
    );
  }
}