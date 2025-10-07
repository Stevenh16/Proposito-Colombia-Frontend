import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/vacancy.dart';
import '../../models/application.dart';
import '../../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://api.swallow.com'; // Cambiar por tu API

  // Headers comunes
  Map<String, String> _getHeaders({String? token}) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // ============ VACANTES ============

  Future<List<Vacancy>> getVacancies({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
        if (search != null) 'search': search,
      };

      final uri = Uri.parse('$baseUrl/vacancies')
          .replace(queryParameters: queryParams);

      final response = await http.get(uri, headers: _getHeaders());

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Vacancy.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar vacantes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }

  Future<Vacancy> getVacancyById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/vacancies/$id'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        return Vacancy.fromJson(json.decode(response.body));
      } else {
        throw Exception('Vacante no encontrada');
      }
    } catch (e) {
      throw Exception('Error al cargar vacante: $e');
    }
  }

  // ============ POSTULACIONES ============

  Future<Application> applyToVacancy({
    required String vacancyId,
    required String userId,
    String? notes,
  }) async {
    try {
      final body = json.encode({
        'vacancyId': vacancyId,
        'userId': userId,
        'notasUsuario': notes,
      });

      final response = await http.post(
        Uri.parse('$baseUrl/applications'),
        headers: _getHeaders(),
        body: body,
      );

      if (response.statusCode == 201) {
        return Application.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al postular');
      }
    } catch (e) {
      throw Exception('Error al postular: $e');
    }
  }

  Future<List<Application>> getUserApplications(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/applications/user/$userId'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Application.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar postulaciones');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }

  // ============ USUARIO ============

  Future<User> getUserProfile(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Usuario no encontrado');
      }
    } catch (e) {
      throw Exception('Error al cargar perfil: $e');
    }
  }

  Future<User> updateUserProfile(User user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/${user.id}'),
        headers: _getHeaders(),
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al actualizar perfil');
      }
    } catch (e) {
      throw Exception('Error al actualizar perfil: $e');
    }
  }

  // ============ AUTENTICACIÓN ============

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: _getHeaders(),
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Credenciales inválidas');
      }
    } catch (e) {
      throw Exception('Error de autenticación: $e');
    }
  }

  Future<Map<String, dynamic>> register({
    required String nombre,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: _getHeaders(),
        body: json.encode({
          'nombre': nombre,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Error en el registro');
      }
    } catch (e) {
      throw Exception('Error de registro: $e');
    }
  }
}