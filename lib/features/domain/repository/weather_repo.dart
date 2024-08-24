import 'package:dartz/dartz.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<FailureErr, WeatherEntity>> getWeatherByCityNameRepo(String shaharNomi);

  Future<Either<FailureErr, WeatherEntity>> getWeatherByLocationRepo();
}
