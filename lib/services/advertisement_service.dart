import 'dart:typed_data';

import 'package:swallow_app/models/advertisement.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:swallow_app/models/api_response.dart';

class AdvertisementService {
  static const String baseUrl = "http://localhost:3210/anuncios";

  static Future<Advertisement> create(int idVacante, http.MultipartFile file) async {
    final url = Uri.parse(baseUrl);
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest('POST',url);
    request.headers.addAll(headers);
    request.files.add(file);
    request.fields['idVacante'] = jsonEncode(idVacante);
    final response = await http.Response.fromStream(await request.send());
    if(response.statusCode==200){
      return ApiResponse<Advertisement>.fromJson(jsonDecode(response.body),(data) => Advertisement.fromJson(data)).datos;
    } else {
      throw Exception("Error al crear el anuncio: ${response.body}");
    }
  }

  static Future<Advertisement> update(int id, http.MultipartFile file) async {
    final url = Uri.parse("$baseUrl/$id/imagen");
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest('PUT',url);
    request.headers.addAll(headers);
    request.files.add(file);
    final response = await http.Response.fromStream(await request.send());
    if(response.statusCode==200){
      return ApiResponse<Advertisement>.fromJson(jsonDecode(response.body),(data) => Advertisement.fromJson(data)).datos;
    } else {
      throw Exception("Error al actualizar el anuncio: ${response.body}");
    }
  }

  static Future<int> delete(int id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return ApiResponse<int>.fromJson(jsonDecode(response.body),(data) => data).datos;
  }

  static Future<Advertisement> findById(int id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<Advertisement>.fromJson(jsonDecode(response.body),(data) => Advertisement.fromJson(data)).datos;
    } else {
      throw Exception("Error al obtener anuncio por id: ${response.body}");
    }
  }

  static Future<List<Advertisement>> findAll() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<List<Advertisement>>.fromJson(jsonDecode(response.body),(data) => (data as List).map((e) => Advertisement.fromJson(e)).toList()).datos;
    } else {
      throw Exception("Error al listar los anuncion: ${response.body}");
    }
  }

  static Future<Advertisement> findByVacanteId(int vacanteId) async {
    final url = Uri.parse("$baseUrl/vacante/$vacanteId");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<Advertisement>.fromJson(jsonDecode(response.body),(data) => Advertisement.fromJson(data)).datos;
    } else {
      throw Exception("Error al obtener anuncio por id de vacante: ${response.body}");
    }
  }

  static Future<Uint8List?> obtenerImagen(int id) async {
    final url = Uri.parse("$baseUrl/$id/imagen");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Error al obtener imagen: ${response.statusCode}");
    }
  }
}