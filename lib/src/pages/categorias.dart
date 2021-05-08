import 'package:app_de_noticias/src/api/Noticias_Api.dart';
import 'package:app_de_noticias/src/model/noticia_model.dart';
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
        onPressed: () async{
          //Navigator.pushNamed(context, 'crear_noticia');
          final noticias = await NoticiasApi.instance.obtenerNoticia();
          print(noticias);
        },
      ),
      body: Container(
        //defino los tamaños del container principal 
        height:size.height,   //todo el largo de la pantalla 
        width:size.width,     //todo el tamaño de la pantalla ancha
        //creo un listview
        child: FutureBuilder(
          future: NoticiasApi.instance.obtenerMisNoticia(),
          builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
            if(snapshot.hasData){
              final noticias = snapshot.data;
              return ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (BuildContext context, int index)=>_card(noticia: noticias[index],size: size)
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

         decoration: BGColor.decor
         
      )
    );
  }
  Widget _card({Noticia noticia,Size size}){
    return Container( //la forma del card
      margin: EdgeInsets.only(top: 25),
      padding:EdgeInsets.only(bottom: 20,left: 10,right: 10),
      child:  Container(
        decoration:BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(15)
        ),
        child: Column( // contenido del card
          children: [
            ListTile( //encabezado
              title: Text('${noticia.creadoPor.nombre}'),
              subtitle: Text("Publicado en ${noticia.ciudadPublicacion}, ${noticia.paisPublicacion.substring(0,1)}${noticia.paisPublicacion.substring(1)} ${noticia.createdAt.day} de ${_mes(mes: noticia.createdAt.month)}"),
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
                   image: AssetImage("assets/no-image.png"),
                   fit: BoxFit.fill,
                   
                 )
               ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:15),
              child: Row(
                children: [
                  Text('${noticia.titulo}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:15),
              margin: EdgeInsets.only(top:5,bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width*0.7,
                                      child: Text("${noticia.descripcion}",style: TextStyle(
                        fontSize: 12,
                    ),),
                  ),
                ],
              )
            ), //titulo de la noticia
          ],
        ),
      )
    );

  }
  String _mes({int mes}){
  String nombreMes = '';
  switch (mes) {
    case 1:
      nombreMes = 'enero';
    break;
    case 2:
     nombreMes = 'febrero'; 
    break;
    case 3:
     nombreMes = 'marzo'; 
    break;
    case 4:
      nombreMes = 'abril';
    break;
    case 5:
      nombreMes = 'mayo';
    break;
    case 6:
      nombreMes = 'junio';
    break;
    case 7:
      nombreMes = 'julio';
    break;
    case 8:
      nombreMes = 'agosto';
    break;
    case 9:
      nombreMes = 'septiembre';
    break;
    case 10:
      nombreMes = 'octubre';
    break;
    case 11:
      nombreMes = 'noviembre';
    break;
    case 12:
      nombreMes = 'diciembre';
    break;
    default:
  }

  return nombreMes;
}
}