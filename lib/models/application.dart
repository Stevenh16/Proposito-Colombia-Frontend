enum ApplicationStatus {
  pendiente,
  enRevision,
  aceptada,
  rechazada,
  entrevista,
}

class Application {
  final String id;
  final String vacancyId;
  final String userId;
  final DateTime fechaPostulacion;
  final ApplicationStatus estado;
  final String? notasUsuario;
  final String? notasEmpresa;

  Application({
    required this.id,
    required this.vacancyId,
    required this.userId,
    required this.fechaPostulacion,
    required this.estado,
    this.notasUsuario,
    this.notasEmpresa,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'] as String,
      vacancyId: json['vacancyId'] as String,
      userId: json['userId'] as String,
      fechaPostulacion: DateTime.parse(json['fechaPostulacion'] as String),
      estado: ApplicationStatus.values.firstWhere(
            (e) => e.toString() == 'ApplicationStatus.${json['estado']}',
        orElse: () => ApplicationStatus.pendiente,
      ),
      notasUsuario: json['notasUsuario'] as String?,
      notasEmpresa: json['notasEmpresa'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vacancyId': vacancyId,
      'userId': userId,
      'fechaPostulacion': fechaPostulacion.toIso8601String(),
      'estado': estado.toString().split('.').last,
      'notasUsuario': notasUsuario,
      'notasEmpresa': notasEmpresa,
    };
  }

  Application copyWith({
    String? id,
    String? vacancyId,
    String? userId,
    DateTime? fechaPostulacion,
    ApplicationStatus? estado,
    String? notasUsuario,
    String? notasEmpresa,
  }) {
    return Application(
      id: id ?? this.id,
      vacancyId: vacancyId ?? this.vacancyId,
      userId: userId ?? this.userId,
      fechaPostulacion: fechaPostulacion ?? this.fechaPostulacion,
      estado: estado ?? this.estado,
      notasUsuario: notasUsuario ?? this.notasUsuario,
      notasEmpresa: notasEmpresa ?? this.notasEmpresa,
    );
  }

  String getEstadoTexto() {
    switch (estado) {
      case ApplicationStatus.pendiente:
        return 'Pendiente';
      case ApplicationStatus.enRevision:
        return 'En Revisión';
      case ApplicationStatus.aceptada:
        return 'Aceptada';
      case ApplicationStatus.rechazada:
        return 'Rechazada';
      case ApplicationStatus.entrevista:
        return 'Entrevista';
    }
  }
}