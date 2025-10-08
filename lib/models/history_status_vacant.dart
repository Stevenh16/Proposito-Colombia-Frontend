import 'package:swallow_app/models/status_vacant.dart';
import 'package:swallow_app/models/vacancy.dart';

class HistoryStatusVacant {
  final int id;
  final Vacancy vacante;
  final StatusVacant estadoVacante;
  final DateTime fechaHistorialEstadoVacante;

  HistoryStatusVacant({
    required this.id,
    required this.vacante,
    required this.estadoVacante,
    required this.fechaHistorialEstadoVacante,
  });

  /*factory HistoryStatusVacant.fromJson(Map<String, dynamic> json){
    return HistoryStatusVacant(
      id: json['id'] ?? 0,
      idVacante: json['idVacante'] ?? 0,
      idEstadoVacante: json['idEstadoVacante'] ?? 0,
      fechaHistorialEstadoVacante: DateTime.parse(json['fechaHistorialEstadoVacante']),
    );
  }*/
}