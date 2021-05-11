import 'dart:async';
import 'dart:convert';
import 'package:app_de_noticias/src/api/Auth_Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  Auth._internal();
  static Auth _instance = Auth._internal();
  static Auth get instance => _instance;

  final _storage = FlutterSecureStorage();
  final key = "SESSION";

  Completer _completer;


  Future<String> get accessToken async {
    if (_completer != null) {
      await _completer.future;
    }
    print("accessToken");
    _completer = Completer();

    final Session session = await this.getSession();
    if (session!= null && session.token!=null && session.expiresIn!=null) {
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = session.createdAt;
      final int expiresIn = session.expiresIn;
      final int diff = currentDate.difference(createdAt).inSeconds;

      final int time = expiresIn-diff;
      print("time ${time.toString()}");
      if (time >= 360) {
        print("token alive");
        _complete();
        return session.token;
      } 
      else{
        final Map<String, dynamic> data = await AuthenticationApi.instance.refresh(session.token);
        if (data != null) {
          await this.setSession(data:data);
          _complete();
          return data['token'];
        }
        _complete();
        return null;
      }
    }
    _complete();
    return null;
  }

  _complete() {
    if (this._completer != null && !this._completer.isCompleted) {
      this._completer.complete();
    }
  }

  
  Future<void> setSession({Map<String, dynamic> data}) async {
    final Session session = Session(
      token: data['token'],
      expiresIn: int.parse(data['expiresIn']),
      createdAt: DateTime.now(),
    );
    print('save');
    final String value = jsonEncode(session.toJson());
    await this._storage.write(key: key, value: value);
    print("session saved");
  }

  Future<Session> getSession() async {
    final String value = await this._storage.read(key: key);
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(json);
      return session;
    }

    //BuildContext context;
    //logOut(context);
    return null;
  }

  Future<void> logOut(BuildContext context) async {
    await this._storage.deleteAll();
    Navigator.pushNamedAndRemoveUntil(
      context,
      'login',
      (_) => false,
    );
  }

  Future<void> logOutData(BuildContext context) async{
      await this._storage.deleteAll();
        Navigator.pushNamedAndRemoveUntil(
            context,'login',(_) => false,
      );
  }
}

class Session {
  final String token;
  final int expiresIn;
  final DateTime createdAt;
  Session({
    @required this.token,
    @required this.expiresIn,
    @required this.createdAt,
  });

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['token'],
      expiresIn: json['expiresIn'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": this.token,
      "expiresIn": this.expiresIn,
      "createdAt": this.createdAt.toString(),
    };
  }
}