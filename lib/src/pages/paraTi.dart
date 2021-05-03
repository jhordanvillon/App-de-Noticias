import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:app_de_noticias/src/widgets/menu.dart';
import 'package:flutter/material.dart';
class ParaTiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //linea que define el tamaño de la pantalla del dispositivo 
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
        //defino los tamaños del container principal 
        height:size.height,   //todo el largo de la pantalla 
        width:size.width,     //todo el tamaño de la pantalla ancha
        //creo un listview
        child: ListView(
          children: [
            _card(),
            _card(),
            _card(),
            _card()
          ],
        ),

         decoration: BGColor.decor
         
      )
    );
  }
  Widget _card(){
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

  } // fin de todo el card.

}
/*
 child: Image(
                  fit: BoxFit.fill,
                  image:AssetImage("assets/unnamed.jpg"),
                  
                )
*/