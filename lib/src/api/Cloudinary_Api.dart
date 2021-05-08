import 'dart:typed_data';

import 'package:app_de_noticias/src/model/photo_model.dart';
import 'package:app_de_noticias/src/utils/dialogs.dart';
import 'package:app_de_noticias/src/utils/extras.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PhotoAPI {
  PhotoAPI._internal();
  static PhotoAPI _instance = PhotoAPI._internal();
  static PhotoAPI get instance => _instance;

  final Dio _dio = new Dio();

  Future<PhotoModel> uploadPhoto(
      Uint8List bytes, String filePath, BuildContext context) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.show();
    try {
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes,
            filename: Extras.getFileName(filePath))
      });
      final Response response = await this._dio.post(
          'https://api.cloudinary.com/v1_1/do9yplt9g/image/upload?upload_preset=jn2hycwx',
          data: formData,
          options: Options(headers: {'content-type': 'multipart/form-data'}));
      progressDialog.dismiss();
      PhotoModel photoModel = new PhotoModel(
          publicId: response.data['public_id'],
          secureUrl: response.data['secure_url']);
      return photoModel;
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response.data);
      }
      print("Error ${e.toString()}");
      return null;
    }
  }
}