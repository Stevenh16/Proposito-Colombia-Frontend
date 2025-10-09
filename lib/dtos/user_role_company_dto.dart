class UserRoleCompanyDto {
  final int idUsuario;
  final int idEmpresa;
  final int permisoRelUsuarioEmpresa;

  UserRoleCompanyDto({
    required this.idUsuario,
    required this.idEmpresa,
    required this.permisoRelUsuarioEmpresa,
  });

  factory UserRoleCompanyDto.fromJson(Map<String, dynamic> json) {
    return UserRoleCompanyDto(
      idUsuario: json['idUsuario'] ?? 0,
      idEmpresa: json['idEmpresa'] ?? 0,
      permisoRelUsuarioEmpresa: json['permisoRelUsuarioEmpresa'] ?? 0,
    );
  }
}
