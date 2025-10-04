import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/vacancy.dart';

class VacancyService {
  static const String baseUrl = "http://localhost:3210/vacantes";

  Future<List<Vacancy>> getAllVacantes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => (data as List).map((e) => Vacancy.fromJson(e)).toList(),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener las vacantes: ${response.statusCode}");
    }
  }

  Future<Vacancy> getVacanteById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(jsonData, (data) => Vacancy.fromJson(data));
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener la vacante con id $id: ${response.statusCode}");
    }
  }

  Future<Vacancy> createVacante(Vacancy vacante) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": vacante.id,
        "idUbicacion": vacante.idUbicacion,
        "tituloVacante": vacante.tituloVacante,
        "descripcionCorta": vacante.descripcionCorta,
        "fechaInicioVacante": vacante.fechaInicioVacante,
        "fechaFinVacante": vacante.fechaFinVacante,
        "estadoVacante": vacante.estadoVacante,
        "palabrasClaveIds": vacante.palabrasClaveIds,
        "requisitoIds": vacante.requisitoIds,
        "idRangoSalarial": vacante.idRangoSalarial,
        "idJornada": vacante.idJornada,
        "idModalidad": vacante.idModalidad,
        "idContrato": vacante.idContrato,
        "idPeriodicidad": vacante.idPeriodicidad,
        "relUsuarioEmpresaId": vacante.relUsuarioEmpresaId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(jsonData, (data) => Vacancy.fromJson(data));
      return apiResponse.datos;
    } else {
      throw Exception("Error al crear la vacante: ${response.statusCode}");
    }
  }

  Future<Vacancy> updateVacante(int id, Vacancy vacante) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": vacante.id,
        "idUbicacion": vacante.idUbicacion,
        "tituloVacante": vacante.tituloVacante,
        "descripcionCorta": vacante.descripcionCorta,
        "fechaInicioVacante": vacante.fechaInicioVacante,
        "fechaFinVacante": vacante.fechaFinVacante,
        "estadoVacante": vacante.estadoVacante,
        "palabrasClaveIds": vacante.palabrasClaveIds,
        "requisitoIds": vacante.requisitoIds,
        "idRangoSalarial": vacante.idRangoSalarial,
        "idJornada": vacante.idJornada,
        "idModalidad": vacante.idModalidad,
        "idContrato": vacante.idContrato,
        "idPeriodicidad": vacante.idPeriodicidad,
        "relUsuarioEmpresaId": vacante.relUsuarioEmpresaId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(jsonData, (data) => Vacancy.fromJson(data));
      return apiResponse.datos;
    } else {
      throw Exception("Error al actualizar la vacante con id $id: ${response.statusCode}");
    }
  }

  Future<int> deleteVacante(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(jsonData, (data) => data as int);
      return apiResponse.datos;
    } else {
      throw Exception("Error al eliminar la vacante con id $id: ${response.statusCode}");
    }
  }

  Future<List<Vacancy>> getVacantesByEmpresa(int empresaId) async {
    final response = await http.get(Uri.parse("$baseUrl/empresa/$empresaId"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => (data as List).map((e) => Vacancy.fromJson(e)).toList(),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener las vacantes de la empresa $empresaId: ${response.statusCode}");
    }
  }

  Future<List<Vacancy>> getVacantesByUsuarioAndEmpresa(int idUsuario, int idEmpresa) async {
    final response = await http.get(Uri.parse("$baseUrl/usuario/$idUsuario/empresa/$idEmpresa"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(
        jsonData,
        (data) => (data as List).map((e) => Vacancy.fromJson(e)).toList(),
      );
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener vacantes del usuario $idUsuario en empresa $idEmpresa: ${response.statusCode}");
    }
  }

  Future<int> getDiasPublicados(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id/dias-publicados"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final apiResponse = ApiResponse.fromJson(jsonData, (data) => data as int);
      return apiResponse.datos;
    } else {
      throw Exception("Error al obtener los días publicados para la vacante $id: ${response.statusCode}");
    }
  }
}