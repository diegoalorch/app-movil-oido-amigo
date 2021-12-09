import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier {
  final baseUrl = 'app-web-oidoamigo.herokuapp.com';
  final token = '';

  final storage = new FlutterSecureStorage();
  var log = Logger();

  Future<String?> login(String nomuser, String password) async {
    final url = Uri.https(baseUrl, '/api/auth/login');
    final resp = await http.post(url,
        body: json.encode({"username": nomuser, "password": password}),
        headers: {"Content-Type": "application/json"});
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    final token = json.decode(resp.body)['accessToken'];

    //log.i('token: ' + token);

    if (decodedResp.containsKey('accessToken')) {
      await storage.write(
          key: 'accessToken', value: decodedResp['accessToken']);

      return null;
    } else {
      return decodedResp['message'];
    }
  }

  Future logOut() async {
    await storage.delete(key: 'accessToken');
  }

  Future<String> isAuthenticated() async {
    return await storage.read(key: 'accessToken') ?? '';
  }
}
