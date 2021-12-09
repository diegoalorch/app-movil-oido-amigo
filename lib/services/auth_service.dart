import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Future<List> readPsicologo() async {
    var id = '1';
    String token = await storage.read(key: 'accessToken') ?? '';
    final url =
        Uri.http(baseUrl, '/api/psicologos/lista-psicologos-nom-apl/' + id);
    final resp =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    final List data = json.decode(resp.body);

    //log.i('Aqui Map: ${datamap}');

    //log.i('Aqui Data: ${data}');

    //log.i(token);

    //log.i('Aqui Map: ${data}');

    return data;
  }

  Future<void> updatePsicologo(
      String pass, String password, String username) async {
    try {
      var id = '1';
      final url = Uri.http(baseUrl, '/api/auth/users/update/' + id);
      final resp = await http.put(url,
          body: json.encode({
            "pass": pass,
            "password": password,
            "username": username,
          }),
          headers: {
            "Content-Type": "application/json",
          });

      showToatSes();
    } catch (e) {
      print(e);
    }
  }

  void showToatSes() => Fluttertoast.showToast(
      msg: "Usuario actualizado exitosamente...!",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green[300],
      textColor: Colors.white);
}
