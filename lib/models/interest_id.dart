class InterestId {
  int idEmpresa;
  int idUsuario;

  InterestId({
    required this.idEmpresa,
    required this.idUsuario,
  });

  factory InterestId.fromJson(Map<String, dynamic> json){
    return InterestId(
      idEmpresa: json['idEmpresa'] ?? 0,
      idUsuario: json['idUsuario'] ?? 0,
    );
  }
}