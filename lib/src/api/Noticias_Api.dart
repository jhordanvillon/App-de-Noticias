
import 'package:app_de_noticias/src/model/noticia_model.dart';
import 'package:app_de_noticias/src/services/Auth.dart';
import 'package:app_de_noticias/src/utils/dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NoticiasApi {
  NoticiasApi._internal();
  static NoticiasApi _instance = NoticiasApi._internal();
  static NoticiasApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://noticiasjhordan.herokuapp.com/api/noticia',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future<List<Noticia>> obtenerNoticia() async{
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await this._dio.get('/');
      print(response.data);
      if(response.statusCode == 200){
        final noticias = Noticias.fromJsonList(response.data);
        return noticias.items;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Noticia>> obtenerMisNoticia() async{
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await this._dio.get('/ver-mis-noticias',
        options: Options(headers: {"Auth":token})
      );
      print(response.data);
      if(response.statusCode == 200){
        final noticias = Noticias.fromJsonList(response.data);
        return noticias.items;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> crearNoticia({
    String titulo,
    String descripcion,
    String imgLink,
    String imgId,
    String paisNoticia,
    String paisPublicacion,
    String ciudadNoticia,
    String ciudadPublicacion,
    BuildContext context
  }) async{
    final token = await Auth.instance.accessToken;
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post('/',
        options: Options(headers: {"Auth":token}),
        data: {
          "titulo":titulo,
          "descripcion":descripcion,
          "imgLink":imgLink,
          "imgId":imgId,
          "paisNoticia":paisNoticia,
          "paisPublicacion":paisPublicacion,
          "ciudadNoticia":ciudadNoticia,
          "ciudadPublicacion":ciudadPublicacion
        }
      );
      progressDialog.dismiss();
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      progressDialog.dismiss();
      return false;
    }
  }
}