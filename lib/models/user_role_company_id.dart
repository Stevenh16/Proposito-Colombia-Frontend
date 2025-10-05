class UserRoleCompanyId {
  final int idUsuario;
  final int idEmpresa;

  UserRoleCompanyId({
    required this.idUsuario,
    required this.idEmpresa,
  });

  factory UserRoleCompanyId.fromJson(Map<String, dynamic> json){
    return UserRoleCompanyId(
      idUsuario: json['idUjsonsuario'] ?? 0,
      idEmpresa: json['idEmpresa'] ?? 0,
    );
  }
}