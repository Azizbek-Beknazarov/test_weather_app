part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
}

class InitialWeather extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadingWeather extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadedWeather extends WeatherState {
  final WeatherEntity weather;

  const LoadedWeather({required this.weather});

  @override
  List<Object> get props => [weather];
}

class ErrorWeather extends WeatherState {
  final String errorMessage;

  const ErrorWeather({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
