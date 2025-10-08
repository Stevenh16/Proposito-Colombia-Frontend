import 'package:swallow_app/models/user_role_company_id.dart';

class UserRoleCompany {
  final UserRoleCompanyId id;
  final int permisoRelUsuarioEmpresa;

  UserRoleCompany({
    required this.id,
    required this.permisoRelUsuarioEmpresa,
  });

  /*factory UserRoleCompany.fromJson(Map<String, dynamic> json){
    return UserRoleCompany(
      id: UserRoleCompanyId.fromJson(json['id']),
      permisoRelUsuarioEmpresa: json['permisoRelUsuarioEmpresa'] ?? 0,
    );
  }*/
}