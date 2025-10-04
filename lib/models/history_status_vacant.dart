class HistoryStatusVacant {
  final int id;
  final int idVacante;
  final int idEstadoVacante;
  final DateTime fechaHistorialEstadoVacante;

  HistoryStatusVacant({
    required this.id,
    required this.idVacante,
    required this.idEstadoVacante,
    required this.fechaHistorialEstadoVacante,
  });

  factory HistoryStatusVacant.fromJson(Map<String, dynamic> json){
    return HistoryStatusVacant(
      id: json['id'] ?? 0,
      idVacante: json['idVacante'] ?? 0,
      idEstadoVacante: json['idEstadoVacante'] ?? 0,
      fechaHistorialEstadoVacante: DateTime.parse(json['fechaHistorialEstadoVacante']),
    );
  }
}