import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/core/usecase/use_case.dart';
import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

import '../repository/weather_repo.dart';

class GetWeatherDataByLocation implements UseCase<WeatherEntity, NoParams> {
  final WeatherRepository weatherRepository;

  GetWeatherDataByLocation(this.weatherRepository);

  @override
  Future<Either<FailureErr, WeatherEntity>> call(params) async {
    return await weatherRepository.getWeatherByLocationRepo();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
