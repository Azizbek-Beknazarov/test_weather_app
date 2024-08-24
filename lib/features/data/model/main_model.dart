import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

class MainModel extends Main {
  MainModel({required super.temp, required super.pressure, required super.humidity});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(temp: json['temp'].toDouble(), pressure: json['pressure'].toDouble(), humidity: json['humidity'].toDouble());
  }
}
