import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Ses1Service {
  final String urlBase = 'app-web-oidoamigo.herokuapp.com';
  final storage = new FlutterSecureStorage();
  var log = Logger();

  Future<void> crateSes1(
      String link, String fecha, String hora, int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-sesion1');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "link": link,
            "fecha": fecha,
            "hora": hora,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatSes();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateSes2(
      String link, String fecha, String hora, int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-sesion2');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "link": link,
            "fecha": fecha,
            "hora": hora,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatSes();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateSes3(
      String link, String fecha, String hora, int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-sesion3');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "link": link,
            "fecha": fecha,
            "hora": hora,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatSes();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateRep1(
      String obserg,
      String ante,
      String problem,
      String accreal,
      String conclu,
      String recotare,
      String fecha,
      int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-reporte1');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "obserg": obserg,
            "ante": ante,
            "problem": problem,
            "accreal": accreal,
            "conclu": conclu,
            "recotare": recotare,
            "fecha": fecha,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatRep();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateRep2(
      String obserg,
      String ante,
      String problem,
      String accreal,
      String conclu,
      String recotare,
      String fecha,
      int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-reporte2');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "obserg": obserg,
            "ante": ante,
            "problem": problem,
            "accreal": accreal,
            "conclu": conclu,
            "recotare": recotare,
            "fecha": fecha,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatRep();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateRep3(
      String obserg,
      String ante,
      String problem,
      String accreal,
      String conclu,
      String recotare,
      String fecha,
      int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-reporte3');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "obserg": obserg,
            "ante": ante,
            "problem": problem,
            "accreal": accreal,
            "conclu": conclu,
            "recotare": recotare,
            "fecha": fecha,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatRep();
    } catch (e) {
      print(e);
    }
  }

  Future<void> crateRepf(
      String obserg,
      String ante,
      String problem,
      String accreal,
      String conclu,
      String recotare,
      String fecha,
      int idpaciente) async {
    try {
      String token = await storage.read(key: 'accessToken') ?? '';
      final url = Uri.http(urlBase, '/api/paciente/create-reportef');
      final resp = await http.post(url,
          body: json.encode({
            "idpsicologo": 1,
            "idpaciente": idpaciente,
            "obserg": obserg,
            "ante": ante,
            "problem": problem,
            "accreal": accreal,
            "conclu": conclu,
            "recotare": recotare,
            "fecha": fecha,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      showToatRep();
    } catch (e) {
      print(e);
    }
  }

  void showToatSes() => Fluttertoast.showToast(
      msg: "Sesión creada exitosamente...!",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green[300],
      textColor: Colors.white);
  void showToatRep() => Fluttertoast.showToast(
      msg: "Reporte creado exitosamente...!",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green[300],
      textColor: Colors.white);
}
