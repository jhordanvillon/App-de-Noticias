import 'package:app_de_noticias/src/model/usuario_model.dart';
import 'package:app_de_noticias/src/services/Auth.dart';
import 'package:dio/dio.dart';

class UsuarioApi {
  UsuarioApi._internal();
  static UsuarioApi _instance = UsuarioApi._internal();
  static UsuarioApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://noticiasjhordan.herokuapp.com/api/usuario',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );
  
  Future<Usuario> obtenerInfo() async {
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await this._dio.get('/ver-mi-usuario',
      options: Options(headers: {"Auth":token}));
      if(response.statusCode == 200){
        final usuario = Usuario.fromJson(response.data);
        return usuario;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}