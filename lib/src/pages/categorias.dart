import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:app_de_noticias/src/widgets/menu.dart';
import 'package:app_de_noticias/src/widgets/noticia_card.dart';
import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0XFFFCBB6D),
        onPressed: (){
          Navigator.pushNamed(context, 'crear_noticia');
        },
      ),
      body: Container(
        decoration: BGColor.decor,
        child: Column(
          children: [
            Container(height: 50,),
            Container(
                height: 90,
                child: Container(
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _circleCategory(),
                        _circleCategory(),
                        _circleCategory(),
                        _circleCategory(),
                        _circleCategory()
                      ],
                    ),
                  ),
                ),
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            Container(
              height: size.height*0.7,
              child: ListView(
                children: [
                  CardNoticia(),
                  CardNoticia(),
                  CardNoticia(),
                  CardNoticia()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circleCategory(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0XFF475C7A)
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(
              child: Icon(Icons.science,size: 40,),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Science')
              ],
            )
          )
        ],
      )
    );
  }
}

/*

Stack(
        children: [
          Center(
            child: Icon(Icons.science,color: Colors.white,size: 30,),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Science'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
 */