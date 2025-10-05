class Journey {
  final int id;
  final String nombre;

  Journey({
    required this.id,
    required this.nombre,
  });

  factory Journey.fromJson(Map<String, dynamic> json){
    return Journey(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }
}