class ApiResponse<T> {
  final int codigoEstado;
  final String mensaje;
  final T datos;
  final DateTime fechaHora;

  ApiResponse({
    required this.codigoEstado,
    required this.mensaje,
    required this.datos,
    required this.fechaHora,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT){
    return ApiResponse(
      codigoEstado: json['codigoEstado'] ?? 401,
      mensaje: json['mensaje'] ?? 'Error',
      datos: fromJsonT(json['datos']),
      fechaHora: DateTime.parse(json['fechaHora']),
    );
  }
}