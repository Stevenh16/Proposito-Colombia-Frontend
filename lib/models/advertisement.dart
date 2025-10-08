import 'package:swallow_app/models/vacancy.dart';

class Advertisement {
  final int id;
  final Vacancy vacante;
  final String nombrePublicoAnuncio;
  final String nombrePrivadoAnuncio;
  final String tipoAnuncio;
  final String tamanioAnuncio;


  Advertisement({
    required this.id,
    required this.vacante,
    required this.nombrePublicoAnuncio,
    required this.nombrePrivadoAnuncio,
    required this.tipoAnuncio,
    required this.tamanioAnuncio,
  });

  /*factory Advertisement.fromJson(Map<String, dynamic> json){
    return Advertisement(
      id: json['id'] ?? 0,
      vacante: ,
      nombrePublicoAnuncio: json['nombrePublicoAnuncio'] ?? '',
      nombrePrivadoAnuncio: json['nombrePrivadoAnuncio'] ?? '',
      tipoAnuncio: json['tipoAnuncio'] ?? '',
      tamanioAnuncio: json['tamanioAnuncio'] ?? '',
    );
  }*/
}