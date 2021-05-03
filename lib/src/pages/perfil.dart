import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:app_de_noticias/src/widgets/menu.dart';
import 'package:app_de_noticias/src/widgets/noticia_card.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xff010130)),
        ),
        drawer: MenuWidget(),
        extendBodyBehindAppBar: true,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BGColor.decor,
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.1,
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(120)
              ),
            ),
            SizedBox(height: size.height*0.03,),
            Text('Jhordan Villon',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            Text('Miembro desde Agosto,2019',style:TextStyle(fontSize: 22)),
            SizedBox(height: size.height*0.03,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Publicaciones'),
                      Text('500')
                    ],
                  ),
                  Column(
                    children: [
                      Text('Me gustas'),
                      Text('5000')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: size.height*0.03,),
            Container(
              height: size.height*0.5,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 0),
                children: [
                  CardNoticia(),
                  CardNoticia(),
                  CardNoticia(),
                  CardNoticia(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}