class Experiencia {
  final String id;
  final String cargo;
  final String empresa;
  final DateTime fechaInicio;
  final DateTime? fechaFin;
  final String? descripcion;
  final bool trabajoActual;

  Experiencia({
    required this.id,
    required this.cargo,
    required this.empresa,
    required this.fechaInicio,
    this.fechaFin,
    this.descripcion,
    this.trabajoActual = false,
  });

  factory Experiencia.fromJson(Map<String, dynamic> json) {
    return Experiencia(
      id: json['id'] as String,
      cargo: json['cargo'] as String,
      empresa: json['empresa'] as String,
      fechaInicio: DateTime.parse(json['fechaInicio'] as String),
      fechaFin: json['fechaFin'] != null
          ? DateTime.parse(json['fechaFin'] as String)
          : null,
      descripcion: json['descripcion'] as String?,
      trabajoActual: json['trabajoActual'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cargo': cargo,
      'empresa': empresa,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin?.toIso8601String(),
      'descripcion': descripcion,
      'trabajoActual': trabajoActual,
    };
  }

  String getPeriodo() {
    final inicio = '${fechaInicio.month}/${fechaInicio.year}';
    final fin = trabajoActual
        ? 'Actualidad'
        : fechaFin != null
        ? '${fechaFin!.month}/${fechaFin!.year}'
        : 'Actualidad';
    return '$inicio - $fin';
  }
}