class Candidate {
  final String id;
  final String nombre;
  final String apellido;
  final String fotoPerfil;
  final String titulo;
  final List<String> habilidades;
  final String experiencia;
  final String ubicacion;
  final bool isLiked;
  final int matchPercentage;

  Candidate({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.fotoPerfil,
    required this.titulo,
    required this.habilidades,
    required this.experiencia,
    required this.ubicacion,
    this.isLiked = false,
    this.matchPercentage = 0,
  });

  String get nombreCompleto => '$nombre $apellido';

  Candidate copyWith({
    String? id,
    String? nombre,
    String? apellido,
    String? fotoPerfil,
    String? titulo,
    List<String>? habilidades,
    String? experiencia,
    String? ubicacion,
    bool? isLiked,
    int? matchPercentage,
  }) {
    return Candidate(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      fotoPerfil: fotoPerfil ?? this.fotoPerfil,
      titulo: titulo ?? this.titulo,
      habilidades: habilidades ?? this.habilidades,
      experiencia: experiencia ?? this.experiencia,
      ubicacion: ubicacion ?? this.ubicacion,
      isLiked: isLiked ?? this.isLiked,
      matchPercentage: matchPercentage ?? this.matchPercentage,
    );
  }
}