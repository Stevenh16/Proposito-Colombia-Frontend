import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/journey.dart';

class JourneyService {
  static const String baseUrl = "http://localhost:3210/Jornadas";

  static Future<Journey> createJornada(Journey jornada) async {
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": jornada.id,
        "nombre": jornada.nombre,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final apiResponse = ApiResponse<Journey>.fromJson(
        jsonMap,
        (data) => Journey.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception(
        "Error al crear la jornada (${response.statusCode}): ${response.body}",
      );
    }
  }

  static Future<Journey> updateJornada(Journey jornada) async {
    final url = Uri.parse(baseUrl);

    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": jornada.id,
        "nombre": jornada.nombre,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonMap = jsonDecode(response.body);
      final apiResponse = ApiResponse<Journey>.fromJson(
        jsonMap,
        (data) => Journey.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception(
        "Error al actualizar jornada (${response.statusCode}): ${response.body}",
      );
    }
  }

  static Future<int> deleteJornada(int id) async {
    final url = Uri.parse("$baseUrl/$id");

    final response = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final apiResponse = ApiResponse<int>.fromJson(
        jsonMap,
        (data) => data as int,
      );
      return apiResponse.datos;
    } else {
      throw Exception(
        "Error al eliminar jornada (${response.statusCode}): ${response.body}",
      );
    }
  }
}