import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dtos/contract_dto.dart';
import '../models/contract.dart';

class ContractService {
  final String baseUrl = 'http://localhost:3210/contratos';

  Future<Contract> getContratoPorId(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/obtener/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final dto = ContractDto.fromJson(data['datos']);
      return _mapDtoToModel(dto);
    } else {
      throw Exception('Error al obtener contrato por id');
    }
  }

  Future<List<Contract>> getContratos() async {
    final response = await http.get(Uri.parse('$baseUrl/obtener/todos'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> contratosJson = data['datos'] ?? [];
      final dtos = contratosJson.map((e) => ContractDto.fromJson(e)).toList();
      return dtos.map((dto) => _mapDtoToModel(dto)).toList();
    } else {
      throw Exception('Error al obtener contratos');
    }
  }

  Contract _mapDtoToModel(ContractDto dto) {
    return Contract(
      id: dto.id,
      nombre: dto.nombre,
    );
  }
}
