import 'package:app_de_noticias/src/api/Cloudinary_Api.dart';
import 'package:app_de_noticias/src/api/Noticias_Api.dart';
import 'package:app_de_noticias/src/model/photo_model.dart';
import 'package:app_de_noticias/src/utils/extras.dart';
import 'package:app_de_noticias/src/widgets/BGcolor.dart';
import 'package:app_de_noticias/src/widgets/campo_dato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class CrearNoticia extends StatefulWidget {
  @override
  _CrearNoticiaState createState() => _CrearNoticiaState();
}

class _CrearNoticiaState extends State<CrearNoticia> {
  final tituloCtrl = TextEditingController();
  final descripcionCtrl = TextEditingController();
  final paisPubliCtrl = TextEditingController();
  final ciudadPubliCtrl = TextEditingController();
  final paisNotiCtrl = TextEditingController();
  final ciudadNotiCtrl = TextEditingController();
  PickedFile file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BGColor.decor,
          child: SingleChildScrollView(
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
                    controller: tituloCtrl,
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
                        controller: paisNotiCtrl,
                        margin: 10,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 185
                      ),
                      child: CampoDato(
                        placeholder: 'Ciudad',
                        controller: ciudadNotiCtrl,
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
                    controller: descripcionCtrl,
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
                      Text((file != null)?'Imagen seleccionada':'Selecciona tu imagen',style: TextStyle(fontSize: 16),),
                      IconButton(
                        icon: Icon(Icons.photo_camera,size: 35,), 
                        onPressed: () async{
                          file = await Extras.pickImage(false);
                          setState(() {
                                      
                          });
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
                        controller: paisPubliCtrl,
                        margin: 10,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 185
                      ),
                      child: CampoDato(
                        placeholder: 'Ciudad',
                        controller: ciudadPubliCtrl,
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
                        onPressed: () async{
                          PhotoModel photoModel;

                          if(file != null){
                            final bytes = await file.readAsBytes();
                            photoModel = await PhotoAPI.instance.uploadPhoto(bytes, file.path,context);
                          }
                          
                          final isOk = await NoticiasApi.instance.crearNoticia(
                            titulo: tituloCtrl.text,
                            descripcion: descripcionCtrl.text,
                            imgId: photoModel.publicId,
                            imgLink: photoModel.secureUrl,
                            ciudadNoticia: ciudadNotiCtrl.text,
                            ciudadPublicacion: ciudadPubliCtrl.text,
                            paisNoticia: paisNotiCtrl.text,
                            paisPublicacion: paisPubliCtrl.text,
                            context: context
                          );

                          if(isOk){
                            Navigator.pushNamed(context, 'home');
                          }
                        }
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}