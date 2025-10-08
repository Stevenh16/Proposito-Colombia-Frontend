class User {
  final int id;
  final String nombre;

  User({
    required this.id,
    required this.nombre,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'] ?? 0,
      nombre: json['nombreUsuario'] ?? '',
    );
  }
}