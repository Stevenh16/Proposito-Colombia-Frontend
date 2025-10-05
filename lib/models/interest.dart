import 'package:swallow_app/models/interest_id.dart';

class Interest {
  final InterestId id;
  final int tipoInteres;

  Interest({
    required this.id,
    required this.tipoInteres,
  });

  factory Interest.fromJson(Map<String, dynamic> json){
    return Interest(
      id: InterestId.fromJson(json['id']),
      tipoInteres: json['tipoInteres'],
    );
  }
}