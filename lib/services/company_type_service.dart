import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/company_type.dart';

class CompanyTypeService {
  static const String baseUrl = "http://localhost:3210/tipoDeEmpresas";

   Future<CompanyType> getTipoEmpresaById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => CompanyType.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener el tipo de empresa: ${response.body}");
    }
  }

  Future<CompanyType> updateTipoEmpresa(
      int id, CompanyType companyType) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": companyType.id,
        "nombreTipoEmpresa": companyType.nombreTipoEmpresa,
        "estadoTipoEmpresa": companyType.estadoTipoEmpresa,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => CompanyType.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al actualizar el tipo de empresa: ${response.body}");
    }
  }

  Future<bool> deleteTipoEmpresa(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error al eliminar el tipo de empresa: ${response.body}");
    }
  }
}