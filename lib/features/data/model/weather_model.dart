import 'package:test_weather_app/features/data/model/coord_model.dart';
import 'package:test_weather_app/features/data/model/main_model.dart';
import 'package:test_weather_app/features/data/model/sys_model.dart';
import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({required super.coord, required super.main, required super.windSpeed, required super.visibility, required super.icon, required super.description, required super.name, required super.date, required super.cloudiness, required super.sys, required super.timezone});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null as CoordModel,
      main: json['main'] != null ? MainModel.fromJson(json['main']) : null as MainModel,
      windSpeed: json['wind']['speed'].toDouble(),
      visibility: json['visibility'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      name: json['name'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      cloudiness: json["clouds"]['all'],
      sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null as SysModel,
      timezone: json['timezone'] / 3600.toDouble(),
    );
  }
}
