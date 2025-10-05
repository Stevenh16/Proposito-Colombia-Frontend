import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/user_role_company.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRoleCompanyService {
  static const String baseUrl = "http://localhost:3210/relUsuarioEmpresa";

  Future<List<UserRoleCompany>> getAllUsuariosEmpresas() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => (data as List)
            .map((e) => UserRoleCompany.fromJson(e))
            .toList(),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener las relaciones usuario-empresa");
    }
  }

  Future<UserRoleCompany> getByUsuarioId(int usuarioId) async {
    final response = await http.get(Uri.parse("$baseUrl/usuario/$usuarioId"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => UserRoleCompany.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener la relación por usuarioId");
    }
  }

  Future<UserRoleCompany?> getByEmpresaId(int empresaId) async {
    final response = await http.get(Uri.parse("$baseUrl/empresa/$empresaId"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => UserRoleCompany.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener la relación por empresaId");
    }
  }

  Future<UserRoleCompany> createRelUsuarioEmpresa(UserRoleCompany dto) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": dto.id,
        "permisoRelUsuarioEmpresa": dto.permisoRelUsuarioEmpresa,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => UserRoleCompany.fromJson(data),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al crear la relación usuario-empresa");
    }
  }

  Future<bool> deleteByUsuarioAndEmpresa(
      int usuarioId, int empresaId) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/usuario/$usuarioId/empresa/$empresaId"),
    );

    if (response.statusCode == 204 || response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error al eliminar la relación usuario-empresa");
    }
  }
}