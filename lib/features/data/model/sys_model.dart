import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

class SysModel extends Sys {
  SysModel({required super.country, required super.sunrise, required super.sunset});

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      country: json['country'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
    );
  }
}
