class Requirement {
  final int id;
  final int idVacante;
  final String tituloRequisito;
  final String detalleRequisito;
  final int ordenRequisito;

  Requirement({
    required this.id,
    required this.idVacante,
    required this.tituloRequisito,
    required this.detalleRequisito,
    required this.ordenRequisito,
  });

  factory Requirement.fromJson(Map<String, dynamic> json){
    return Requirement(
      id: json['id'] ?? 0,
      idVacante: json['idVacante'] ?? 0,
      tituloRequisito: json['tituloRequisito'] ?? 0,
      detalleRequisito: json['detalleRequisito'] ?? '',
      ordenRequisito: json['ordenRequisito'] ?? 0,
    );
  }
}