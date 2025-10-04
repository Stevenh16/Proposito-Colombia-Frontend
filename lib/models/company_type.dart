class CompanyType {
  final int id;
  final String nombreTipoEmpresa;
  final int estadoTipoEmpresa;

  CompanyType({
    required this.id,
    required this.nombreTipoEmpresa,
    required this.estadoTipoEmpresa,
  });

  factory CompanyType.fromJson(Map<String, dynamic> json){
    return CompanyType(
      id: json['id'] ?? 0,
      nombreTipoEmpresa: json['nombreTipoEmpresa'] ?? '',
      estadoTipoEmpresa: json['estadoTipoEmpresa'] ?? 0,
    );
  }
}