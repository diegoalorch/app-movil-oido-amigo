import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PacienteService extends ChangeNotifier {
  final String urlBase = 'app-web-oidoamigo.herokuapp.com';

  final storage = new FlutterSecureStorage();

  var log = Logger();

  Future<List> readPaciente() async {
    var id = '1';
    String token = await storage.read(key: 'accessToken') ?? '';
    final url = Uri.http(urlBase, '/api/paciente/paciente-asignado/' + id);
    final resp =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    final List data = json.decode(resp.body);

    //log.i('Aqui Map: ${datamap}');

    //log.i('Aqui Data: ${data}');

    //log.i(token);

    //log.i('Aqui Map: ${data}');

    return data;
  }

  Future<void> finPaciente(String id) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/paciente-fin/' + id);
      final resp =
          await http.put(url, headers: {'Authorization': 'Bearer $token'});

      showToatFin();
    } catch (e) {
      print(e);
    }
  }

  void showToatFin() => Fluttertoast.showToast(
      msg: "Paciente Finalizado exitosamente...!",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green[300],
      textColor: Colors.white);
}
