import 'package:dartz/dartz.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/core/usecase/use_case.dart';
import 'package:test_weather_app/features/domain/entity/weather_entity.dart';
import 'package:test_weather_app/features/domain/repository/weather_repo.dart';

class GetWeatherByCityName implements UseCase<WeatherEntity, CityParams> {
  final WeatherRepository weatherRepository;

  GetWeatherByCityName(this.weatherRepository);

  @override
  Future<Either<FailureErr, WeatherEntity>> call(CityParams params) async {
    return await weatherRepository.getWeatherByCityNameRepo(params.cityName);
  }
}
