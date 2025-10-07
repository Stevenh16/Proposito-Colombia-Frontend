class Educacion {
  final String id;
  final String institucion;
  final String titulo;
  final String? areaEstudio;
  final DateTime fechaInicio;
  final DateTime? fechaFin;
  final bool enCurso;

  Educacion({
    required this.id,
    required this.institucion,
    required this.titulo,
    this.areaEstudio,
    required this.fechaInicio,
    this.fechaFin,
    this.enCurso = false,
  });

  factory Educacion.fromJson(Map<String, dynamic> json) {
    return Educacion(
      id: json['id'] as String,
      institucion: json['institucion'] as String,
      titulo: json['titulo'] as String,
      areaEstudio: json['areaEstudio'] as String?,
      fechaInicio: DateTime.parse(json['fechaInicio'] as String),
      fechaFin: json['fechaFin'] != null
          ? DateTime.parse(json['fechaFin'] as String)
          : null,
      enCurso: json['enCurso'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institucion': institucion,
      'titulo': titulo,
      'areaEstudio': areaEstudio,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin?.toIso8601String(),
      'enCurso': enCurso,
    };
  }

  String getPeriodo() {
    final inicio = fechaInicio.year.toString();
    final fin = enCurso
        ? 'En curso'
        : fechaFin?.year.toString() ?? 'Presente';
    return '$inicio - $fin';
  }
}