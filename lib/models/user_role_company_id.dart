import 'package:swallow_app/models/company.dart';
import 'package:swallow_app/models/user.dart';

class UserRoleCompanyId {
  final User usuario;
  final Company empresa;

  UserRoleCompanyId({
    required this.usuario,
    required this.empresa,
  });

  /*factory UserRoleCompanyId.fromJson(Map<String, dynamic> json){
    return UserRoleCompanyId(
      idUsuario: json['idUjsonsuario'] ?? 0,
      idEmpresa: json['idEmpresa'] ?? 0,
    );
  }*/
}