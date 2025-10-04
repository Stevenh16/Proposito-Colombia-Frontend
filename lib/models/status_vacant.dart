class StatusVacant {
  final int id;
  final String nombreEstadoVacante;
  final int ordenEstadoVacante;

  StatusVacant({
    required this.id,
    required this.nombreEstadoVacante,
    required this.ordenEstadoVacante,
  });

  factory StatusVacant.fromJson(Map<String, dynamic> json){
    return StatusVacant(
      id: json['id'] ?? 0,
      nombreEstadoVacante: json['nombreEstadoVacante'] ?? '',
      ordenEstadoVacante: json['ordenEstadoVacante'] ?? 0,
    );
  }
}