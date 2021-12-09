import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PacienteService extends ChangeNotifier {
  final String urlBase = 'app-web-oidoamigo.herokuapp.com';

  final storage = new FlutterSecureStorage();

  var log = Logger();

  Future<List> readPaciente() async {
    try {
      var id = '1';
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/paciente-asignado/' + id);
      final resp =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});

      final List data = json.decode(resp.body);

      final Map<int, dynamic> datamap = data.asMap();

      //log.i('Aqui Map: ${datamap}');

      //log.i('Aqui Data: ${data}');

      //log.i(token);

      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
