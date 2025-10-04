import 'package:swallow_app/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:swallow_app/models/company.dart';
import 'package:swallow_app/models/page.dart';

class CompanyService {
  static const String baseUrl = "http://localhost:3210/empresas";

  static Future<int> getCantidadEmpresas() async {
    final url = Uri.parse("$baseUrl/cantidad");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<int>.fromJson(jsonDecode(response.body), (d)=> d).datos;
    } else {
      throw Exception("Error al obtener la cantidad de empresas: ${response.body}");
    }
  }

  static Future<List<Company>> getAllEmpresas() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<List<Company>>.fromJson(jsonDecode(response.body),(data) => (data as List).map((e) => Company.fromJson(e)).toList()).datos;
    } else {
      throw Exception("Error al listar las empresas: ${response.body}");
    }
  }

  static Future<Page<Company>> buscarEmpresa({
    String filtro = "",
    int page = 0,
    int size = 10,
  }) async {
    final url = Uri.parse("$baseUrl/buscar?filtro=$filtro&page=$page&size=$size");

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final apiResponse = ApiResponse<Page<Company>>.fromJson(
        jsonMap,
        (datosJson) => Page.fromJson(
          datosJson,
          (empresaJson) => Company.fromJson(empresaJson),
        ),
      );
      return apiResponse.datos;
    } else {
      throw Exception(
        "Error ${response.statusCode}: ${response.body}",
      );
    }
  }

  static Future<Company> createEmpresa(Company company) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "id": company.id,
        "idTipoEmpresa": company.idTipoEmpresa,
        "nombreEmpresa": company.nombreEmpresa,
        "direccionEmpresa": company.direccionEmpresa,
        "telefonoEmpresa": company.telefonoEmpresa,
        "interes": company.interes,
        "relUsuarioEmpresa": company.relUsuarioEmpresa,
      }),
    );
    if(response.statusCode==200){
      return ApiResponse<Company>.fromJson(jsonDecode(response.body), (d)=> Company.fromJson(d)).datos;
    } else {
      throw Exception("Error al crear Empresa numero ${response.statusCode}: ${response.body}");
    }
  }

  static Future<Company> updateEmpresa(Company company, int id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "id": company.id,
        "idTipoEmpresa": company.idTipoEmpresa,
        "nombreEmpresa": company.nombreEmpresa,
        "direccionEmpresa": company.direccionEmpresa,
        "telefonoEmpresa": company.telefonoEmpresa,
        "interes": company.interes,
        "relUsuarioEmpresa": company.relUsuarioEmpresa,
      }),
    );
    if(response.statusCode==200){
      return ApiResponse<Company>.fromJson(jsonDecode(response.body), (d)=> Company.fromJson(d)).datos;
    } else {
      throw Exception("Error al actualizar Empresa numero ${response.statusCode}: ${response.body}");
    }
  }

  static Future<Company> deleteEmpresa(Company company) async {
    final url = Uri.parse(baseUrl);
    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "id": company.id,
        "idTipoEmpresa": company.idTipoEmpresa,
        "nombreEmpresa": company.nombreEmpresa,
        "direccionEmpresa": company.direccionEmpresa,
        "telefonoEmpresa": company.telefonoEmpresa,
        "interes": company.interes,
        "relUsuarioEmpresa": company.relUsuarioEmpresa,
      }),
    );

    if(response.statusCode==200){
      return ApiResponse<Company>.fromJson(jsonDecode(response.body), (d)=> Company.fromJson(d)).datos;
    } else {
      throw Exception("Error al eliminar la empresa: ${response.body}");
    }
  }

  static Future<List<Company>> getEmpresasByTipoEmpresa(int tipoEmpresaId) async {
    final url = Uri.parse("$baseUrl/tipo/$tipoEmpresaId");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<List<Company>>.fromJson(jsonDecode(response.body),(data) => (data as List).map((e) => Company.fromJson(e)).toList()).datos;
    } else {
      throw Exception("Error al obtener empresa por id tipo empresa: ${response.body}");
    }
  }
}