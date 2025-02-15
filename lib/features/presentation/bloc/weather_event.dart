part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

//event 1
class GetWeatherByCityNameEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherByCityNameEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

// event 2
class GetWeatherByLocationEvent extends WeatherEvent {
  @override
  List<Object> get props => [];
}
