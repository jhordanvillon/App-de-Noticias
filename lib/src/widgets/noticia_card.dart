import 'package:flutter/material.dart';

class CardNoticia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( //la forma del card
      margin: EdgeInsets.only(top: 25),
      padding:EdgeInsets.symmetric(horizontal:10),
      child:  Container(
        decoration:BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.only(top: 20),
        height: 350,
       

        child: Column( // contenido del card
          children: [
            ListTile( //encabezado
              title: Text("Jhordan Villón"),
              subtitle: Text("Publicado en Lima, Perú 28 de Marzo"),
              leading: CircleAvatar(
                child: Text("J"),
              ),
            ),
            Container( //imagen
              padding: EdgeInsets.symmetric(horizontal:10),
                          child: Container(
                height: 180,
                width:double.infinity, //ocupada todo el espacio disponible
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                 image: DecorationImage(
                   image: AssetImage("assets/unnamed.jpg"),
                   fit: BoxFit.fill,
                   
                 )
               ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:15),
              margin: EdgeInsets.only(top:10),
              child: Text("OG resultó campeón del International 9, haciendo acreedor de 15 millones de dólares.",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
              ),)
            ), //titulo de la noticia
          ],
        ),
      )
    );
  }
}