import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dtos/modality_dto.dart';
import '../models/modality.dart';

class ModalityService {
  final String baseUrl = 'http://localhost:3210/modalidades';

  Future<Modality> getModalityById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/obtener/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final dto = ModalityDto.fromJson(data['datos']);
      return _mapDtoToModel(dto);
    } else {
      throw Exception('Error al obtener modalidad por id');
    }
  }

  Future<List<Modality>> getModalities() async {
    final response = await http.get(Uri.parse('$baseUrl/obtener/todos'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> modalidadesJson = data['datos'] ?? [];
      final dtos = modalidadesJson.map((e) => ModalityDto.fromJson(e)).toList();
      return dtos.map((dto) => _mapDtoToModel(dto)).toList();
    } else {
      throw Exception('Error al obtener modalidades');
    }
  }

  Modality _mapDtoToModel(ModalityDto dto) {
    return Modality(
      id: dto.id,
      nombre: dto.nombre,
    );
  }
}
