import 'package:app_de_noticias/src/model/usuario_model.dart';

class Noticias{
  List<Noticia> items = [];
  Noticias();
  Noticias.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final noticiaData = new Noticia.fromJson(item);
      items.add(noticiaData);
    }
  }
}

class Noticia{
  String id;
  String titulo;
  String descripcion;
  String imgId;
  String imgLink;
  String paisNoticia;
  String ciudadNoticia;
  String paisPublicacion;
  String ciudadPublicacion;
  DateTime createdAt;
  UsuarioSimple creadoPor;

  Noticia({
    this.id,
    this.titulo,
    this.descripcion,
    this.imgId,
    this.imgLink,
    this.paisNoticia,
    this.ciudadNoticia,
    this.paisPublicacion,
    this.ciudadPublicacion,
    this.createdAt,
    this.creadoPor
  });

  factory Noticia.fromJson(Map<String,dynamic> json){
    return Noticia(
      id:json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      imgId: json['imgId'],
      imgLink: json['imgLink'],
      paisNoticia: json['paisNoticia'],
      ciudadNoticia:json['ciudadNoticia'],
      paisPublicacion:json['paisPublicacion'],
      ciudadPublicacion:json['ciudadPublicacion'],
      createdAt:DateTime.parse(json['createdAt']),
      creadoPor: UsuarioSimple.fromJson(json['creadoPor'])
    );
  }
}

class UsuarioSimple{
  String id;
  String nombre;
  String email;

  UsuarioSimple({
    this.id,
    this.nombre,
    this.email
  });

  factory UsuarioSimple.fromJson(Map<String,dynamic> json){
    return UsuarioSimple(
      id: json['_id'],
      nombre: json['nombre'],
      email: json['email']
    );
  }
}