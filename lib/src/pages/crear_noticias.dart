import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:app_de_noticias/src/widgets/campo_dato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CrearNoticia extends StatefulWidget {
  @override
  _CrearNoticiaState createState() => _CrearNoticiaState();
}

class _CrearNoticiaState extends State<CrearNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BGColor.decor,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp,size: 30,), 
                      onPressed: (){
                        Navigator.pushNamed(context, 'home');
                      }
                    ),
                    Text('Crea tu noticia',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Container(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Titulo de la noticia',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CampoDato(
                placeholder: 'Titulo',
                margin: 10,
              )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Pais y Ciudad de la noticia',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 185
                  ),
                  child: CampoDato(
                    placeholder: 'Pais',
                    margin: 10,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 185
                  ),
                  child: CampoDato(
                    placeholder: 'Ciudad',
                    margin: 10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Descripcion de la noticia',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CampoDato(
                placeholder: 'Descripcion',
                margin: 10,
              )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Imagen de la noticia',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Selecciona tu imagen',style: TextStyle(fontSize: 16),),
                  IconButton(
                    icon: Icon(Icons.photo_camera,size: 35,), 
                    onPressed: (){

                    }
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Pais y Ciudad de la publicacion',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 185
                  ),
                  child: CampoDato(
                    placeholder: 'Pais',
                    margin: 10,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 185
                  ),
                  child: CampoDato(
                    placeholder: 'Ciudad',
                    margin: 10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text('Cancelar',style: TextStyle(color: Colors.white),), 
                    onPressed: (){

                    }
                  ),
                  CupertinoButton(
                    child: Text('Crear',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), 
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0XFFFCBB6D),
                    onPressed: (){}
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}