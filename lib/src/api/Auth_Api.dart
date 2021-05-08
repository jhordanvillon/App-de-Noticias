import 'package:app_de_noticias/src/services/Auth.dart';
import 'package:app_de_noticias/src/utils/dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthenticationApi {
  AuthenticationApi._internal();
  static AuthenticationApi _instance = AuthenticationApi._internal();
  static AuthenticationApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://noticiasjhordan.herokuapp.com/api/',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future<dynamic> refresh(String expiredToken) async {
    try {
      final Response response = await this._dio.post(
            '/refresh-token',
            options: Options(headers: {
              'Auth': expiredToken,
            }),
          );
      if (response.statusCode == 403) {
        return null;
      }
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> login({@required BuildContext context,@required String email,@required String password}) async {

    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post('usuario/login', data: {"email": email, "password": password});
      progressDialog.dismiss();
      print(response.data);
      if (response.statusCode == 200) {
        print('Hay datos');
        print(response.data['token']);
        await Auth.instance.setSession(data:response.data);
        return true;
      }
      return false;
    } catch (error) {
      progressDialog.dismiss();
      return false;
    }
  }

  Future<bool> register(
      {@required BuildContext context,
      @required String name,
      @required String password,
      @required String email,}) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post('usuario/registrar', data: {
        "nombre": name,
        "email": email,
        "password": password,
      });

      progressDialog.dismiss();
      print(response.data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        await Auth.instance.setSession(data:response.data);
        return true;
      } 
      return false;
    } catch (error) {
      progressDialog.dismiss();
      if (error is DioError) {
        return false;
      } else {
        return false;
      }
    }
  }

  Future<void> refreshToken() async {
    final expiredToken = await Auth.instance.accessToken;
    print(expiredToken);
    try {
      final Response response = await this._dio.get(
            '/auth/refresh-token',
            options: Options(headers: {
              'Auth': expiredToken,
            }),
          );
    } catch (e) {
      print(e);
      return null;
    }
  }
}