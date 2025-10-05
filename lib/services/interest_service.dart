import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/interest.dart';

class InterestService {
  static const String baseUrl = "http://localhost:3210/intereses";

  Future<Interest> createInteres(Interest dto) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": dto.id,
        "tipoInteres": dto.tipoInteres,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(jsonData, (data) => Interest.fromJson(data)).datos;
    } else {
      throw Exception('Error al crear interes');
    }
  }

  Future<Interest> updateInteres(Interest dto) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": dto.id,
        "tipoInteres": dto.tipoInteres,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(jsonData, (data) => Interest.fromJson(data)).datos;
    } else {
      throw Exception('Error al actualizar interes');
    }
  }

  Future<bool> deleteInteres(int idEmpresa, int idUsuario) async {
    final response = await http.delete(Uri.parse('$baseUrl/$idEmpresa/$idUsuario'));
    return response.statusCode == 200;
  }

  Future<int> obtenerTipoInteres(int idEmpresa, int idUsuario) async {
    final response = await http.get(Uri.parse('$baseUrl/$idEmpresa/$idUsuario/tipo'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(jsonData, (data) => data as int).datos;
    } else {
      throw Exception('Error al obtener tipo de interes');
    }
  }

  Future<List<int>> obtenerEmpresasSeguidas(int idUsuario, int tipoInteres) async {
    final response = await http.get(Uri.parse('$baseUrl/usuario/$idUsuario/empresas?tipoInteres=$tipoInteres'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(
        jsonData,
        (data) => List<int>.from(data),
      ).datos;
    } else {
      throw Exception('Error al obtener empresas seguidas');
    }
  }

  Future<List<int>> obtenerUsuariosSeguidos(int idEmpresa, int tipoInteres) async {
    final response = await http.get(Uri.parse('$baseUrl/empresa/$idEmpresa/usuarios?tipoInteres=$tipoInteres'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(
        jsonData,
        (data) => List<int>.from(data),
      ).datos;
    } else {
      throw Exception('Error al obtener usuarios seguidos');
    }
  }

  Future<List<Interest>> obtenerRelacionesMutuas() async {
    final response = await http.get(Uri.parse('$baseUrl/match'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ApiResponse.fromJson(
        jsonData,
        (data) => (data as List)
            .map((item) => Interest.fromJson(item))
            .toList(),
      ).datos;
    } else if (response.statusCode == 204) {
      return [];
    } else {
      throw Exception('Error al obtener relaciones mutuas');
    }
  }

  Future<bool> usuarioSigueEmpresa(int idEmpresa, int idUsuario) async {
    final response = await http.post(Uri.parse('$baseUrl/$idEmpresa/$idUsuario/usuarioSigueEmpresa'));
    return response.statusCode == 200;
  }

  Future<bool> empresaSigueUsuario(int idEmpresa, int idUsuario) async {
    final response = await http.post(Uri.parse('$baseUrl/$idEmpresa/$idUsuario/empresaSigueUsuario'));
    return response.statusCode == 200;
  }

  Future<bool> esSeguimientoMutuo(int idEmpresa, int idUsuario) async {
    final response = await http.get(Uri.parse('$baseUrl/$idEmpresa/$idUsuario/mutuo'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as bool;
    } else {
      throw Exception('Error al verificar seguimiento mutuo');
    }
  }
}