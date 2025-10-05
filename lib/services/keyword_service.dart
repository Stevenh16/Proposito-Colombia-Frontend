import 'package:http/http.dart' as http;
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/keyword.dart';
import 'dart:convert';

class KeywordService {
  static const String baseUrl = "http://localhost:3210/palabrasClave";

  Future<List<Keyword>> getAllPalabrasClaves() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => (data as List)
            .map((item) => Keyword.fromJson(item))
            .toList(),
      );
      return apiResponse.datos;
    } else {
      throw Exception('Error al obtener las palabras clave');
    }
  }

  Future<Keyword> getPalabraClaveById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => Keyword.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception('Error al obtener la palabra clave');
    }
  }

  Future<bool> deletePalabraClave(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error al eliminar la palabra clave');
    }
  }
}