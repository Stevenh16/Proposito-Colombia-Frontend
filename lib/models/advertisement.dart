class Advertisement {
  final int id;
  final int idVacante;
  final String nombrePublicoAnuncio;
  final String nombrePrivadoAnuncio;
  final String tipoAnuncio;
  final String tamanioAnuncio;


  Advertisement({
    required this.id,
    required this.idVacante,
    required this.nombrePublicoAnuncio,
    required this.nombrePrivadoAnuncio,
    required this.tipoAnuncio,
    required this.tamanioAnuncio,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json){
    return Advertisement(
      id: json['id'] ?? 0,
      idVacante: json['idVacante'] ?? 0,
      nombrePublicoAnuncio: json['nombrePublicoAnuncio'] ?? '',
      nombrePrivadoAnuncio: json['nombrePrivadoAnuncio'] ?? '',
      tipoAnuncio: json['tipoAnuncio'] ?? '',
      tamanioAnuncio: json['tamanioAnuncio'] ?? '',
    );
  }
}