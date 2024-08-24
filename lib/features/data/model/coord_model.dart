import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

class CoordModel extends Coord {
  CoordModel({required super.lon, required super.lat});

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(lon: json['lon'].toDouble(), lat: json['lat'].toDouble());
  }
}
