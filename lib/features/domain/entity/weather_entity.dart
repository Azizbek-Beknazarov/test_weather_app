import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final Coord coord;
  final String description;
  final String icon;
  final Main main;
  final double windSpeed;
  final int visibility;
  final String name;
  final DateTime date;
  final int cloudiness;
  final Sys sys;
  final double timezone;

  const WeatherEntity({required this.coord, required this.main, required this.windSpeed, required this.description, required this.icon, required this.visibility, required this.name, required this.date, required this.cloudiness, required this.sys, required this.timezone});

  @override
  List<Object?> get props => [coord, main, windSpeed, visibility, description, icon, name, date, cloudiness, sys, timezone];
}
//

//done
class Coord {
  final double lon;
  final double lat;

  const Coord({required this.lon, required this.lat});
}

class Weather {
  late String main;
  late String description;
  late String icon;

  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });
}

//done
class Main {
  final double temp;
  final double pressure;
  final double humidity;

  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });
}

class Sys {
  final String country;
  final DateTime sunrise;
  final DateTime sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});
}
