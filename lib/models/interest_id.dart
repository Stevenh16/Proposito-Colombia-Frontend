import 'package:swallow_app/models/company.dart';
import 'package:swallow_app/models/user.dart';

class InterestId {
  Company empresa;
  User usuario;

  InterestId({
    required this.empresa,
    required this.usuario,
  });

  /*factory InterestId.fromJson(Map<String, dynamic> json){
    return InterestId(
      empresa: json['idEmpresa'] ?? 0,
      usuario: json['idUsuario'] ?? 0,
    );
  }*/
}