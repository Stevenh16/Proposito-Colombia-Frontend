import 'dart:convert';

class Keyword {
  final int id;
  final String textoPalabraClave;
  final List<int> usuarioIds;
  final List<int> vacanteIds;

  Keyword({
    required this.id,
    required this.textoPalabraClave,
    required this.usuarioIds,
    required this.vacanteIds,
  });

  factory Keyword.fromJson(Map<String, dynamic> json){
    return Keyword(
      id: json['id'] ?? 0,
      textoPalabraClave: json['textoPalabraClave'] ?? '',
      usuarioIds: (jsonDecode(json['usuarioIds']) as List<dynamic>).map((arg) => arg as int)
          .toList(),
      vacanteIds: (jsonDecode(json['vacanteIds']) as List<dynamic>).map((arg) => arg as int)
          .toList(),
    );
  }
}