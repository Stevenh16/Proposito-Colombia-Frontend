import 'dart:convert';

import 'package:swallow_app/models/user_role_company_id.dart';

class Vacancy {
  final int id;
  final int idUbicacion;
  final String tituloVacante;
  final String descripcionCorta;
  final DateTime fechaInicioVacante;
  final DateTime fechaFinVacante;
  final int estadoVacante;
  final List<int> palabrasClaveIds;
  final List<int> requisitoIds;
  final int idRangoSalarial;
  final int idJornada;
  final int idModalidad;
  final int idContrato;
  final int idPeriodicidad;
  final UserRoleCompanyId relUsuarioEmpresaId;

  Vacancy({
    required this.id,
    required this.idUbicacion,
    required this.tituloVacante,
    required this.descripcionCorta,
    required this.fechaInicioVacante,
    required this.fechaFinVacante,
    required this.estadoVacante,
    required this.palabrasClaveIds,
    required this.requisitoIds,
    required this.idRangoSalarial,
    required this.idJornada,
    required this.idModalidad,
    required this.idContrato,
    required this.idPeriodicidad,
    required this.relUsuarioEmpresaId,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json){
    return Vacancy(
      id: json['id'] ?? 0,
      idUbicacion: json['idUbicacion'] ?? 0,
      tituloVacante: json['tituloVacante'] ?? '',
      descripcionCorta: json['descripcionCorta'] ?? '',
      fechaInicioVacante: DateTime.parse(json['fechaInicioVacante']),
      fechaFinVacante: DateTime.parse(json['fechaFinVacante']),
      estadoVacante: json['estadoVacante'] ?? 0,
      palabrasClaveIds: (jsonDecode(json['palabrasClaveIds']) as List<dynamic>).map((arg) => arg as int).toList(),
      requisitoIds: (jsonDecode(json['requisitoIds']) as List<dynamic>).map((arg) => arg as int).toList(),
      idRangoSalarial: json['idRangosalarial'] ?? 0,
      idJornada: json['idJornada'] ?? 0,
      idModalidad: json['idModalidad'] ?? 0,
      idContrato: json['idContrato'] ?? 0,
      idPeriodicidad: json['idPeriodicidad'] ?? 0,
      relUsuarioEmpresaId: UserRoleCompanyId.fromJson(json['relUsuarioEmpresaId']),
    );
  }
}