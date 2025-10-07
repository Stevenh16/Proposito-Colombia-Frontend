import 'educacion.dart';
import 'experiencia.dart';

class User {
  final String id;
  final String nombre;
  final String email;
  final String? telefono;
  final String? ubicacion;
  final String? fotoPerfil;
  final List<String> habilidades;
  final List<Experiencia> experiencia;
  final List<Educacion> educacion;
  final String? biografia;
  final DateTime fechaRegistro;

  User({
    required this.id,
    required this.nombre,
    required this.email,
    this.telefono,
    this.ubicacion,
    this.fotoPerfil,
    this.habilidades = const [],
    this.experiencia = const [],
    this.educacion = const [],
    this.biografia,
    required this.fechaRegistro,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      telefono: json['telefono'] as String?,
      ubicacion: json['ubicacion'] as String?,
      fotoPerfil: json['fotoPerfil'] as String?,
      habilidades: List<String>.from(json['habilidades'] ?? []),
      experiencia: (json['experiencia'] as List?)
          ?.map((e) => Experiencia.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      educacion: (json['educacion'] as List?)
          ?.map((e) => Educacion.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      biografia: json['biografia'] as String?,
      fechaRegistro: DateTime.parse(json['fechaRegistro'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'telefono': telefono,
      'ubicacion': ubicacion,
      'fotoPerfil': fotoPerfil,
      'habilidades': habilidades,
      'experiencia': experiencia.map((e) => e.toJson()).toList(),
      'educacion': educacion.map((e) => e.toJson()).toList(),
      'biografia': biografia,
      'fechaRegistro': fechaRegistro.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? nombre,
    String? email,
    String? telefono,
    String? ubicacion,
    String? fotoPerfil,
    List<String>? habilidades,
    List<Experiencia>? experiencia,
    List<Educacion>? educacion,
    String? biografia,
    DateTime? fechaRegistro,
  }) {
    return User(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      ubicacion: ubicacion ?? this.ubicacion,
      fotoPerfil: fotoPerfil ?? this.fotoPerfil,
      habilidades: habilidades ?? this.habilidades,
      experiencia: experiencia ?? this.experiencia,
      educacion: educacion ?? this.educacion,
      biografia: biografia ?? this.biografia,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
    );
  }
}