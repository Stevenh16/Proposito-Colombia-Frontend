import 'dart:convert';
import 'package:swallow_app/models/api_response.dart';
import 'package:swallow_app/models/history_status_vacant.dart';
import 'package:http/http.dart' as http;

class HistoryStatusVacantService {
  static const String baseUrl = "http://localhost:3210/historialEstadosVacantes";

  static Future<HistoryStatusVacant> getById(int id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if(response.statusCode==200){
      return ApiResponse<HistoryStatusVacant>.fromJson(jsonDecode(response.body),(data) => HistoryStatusVacant.fromJson(data)).datos;
    } else {
      throw Exception("Error al obtener empresa por id tipo empresa: ${response.body}");
    }
  }

  Future<List<HistoryStatusVacant>> getByVacanteId(int vacanteId) async {
    final response = await http.get(Uri.parse('$baseUrl/vacante/$vacanteId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ApiResponse.fromJson(
        jsonData,
        (data) => (data as List)
            .map((item) => HistoryStatusVacant.fromJson(item))
            .toList(),
      ).datos;
    } else {
      throw Exception('Error al obtener historial por id de vacante');
    }
  }

  Future<HistoryStatusVacant> deleteHistorial(HistoryStatusVacant history) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/historial-estado-vacante/${history.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "id": history.id,
        "idVacante": history.idVacante,
        "idEstadoVacante": history.idEstadoVacante,
        "fechaHistorialEstadoVacante": history.fechaHistorialEstadoVacante,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ApiResponse.fromJson(
        jsonData,
        (data) => HistoryStatusVacant.fromJson(data),
      ).datos;
    } else {
      throw Exception('Error al eliminar historial');
    }
  }
}