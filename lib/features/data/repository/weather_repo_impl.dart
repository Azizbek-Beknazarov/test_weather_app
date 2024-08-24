import 'package:dartz/dartz.dart';
import 'package:test_weather_app/core/error/exception.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/core/network/network_info.dart';
import 'package:test_weather_app/features/data/datasource/weather_remote_datasource.dart';
import 'package:test_weather_app/features/data/model/weather_model.dart';
import 'package:test_weather_app/features/domain/entity/weather_entity.dart';

import '../../domain/repository/weather_repo.dart';

class WeatherRepositoryImple implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  final NetworkInfo info;

  WeatherRepositoryImple({
    required this.remoteDataSource,
    required this.info,
  });

  @override
  Future<Either<FailureErr, WeatherEntity>> getWeatherByCityNameRepo(String cityName) async {
    return await _getWeather(() => remoteDataSource.getWeatherCityNameDatasourse(cityName));
  }

  @override
  Future<Either<FailureErr, WeatherEntity>> getWeatherByLocationRepo() async {
    return await _getWeather(() => remoteDataSource.getWeatherLocationDatasourse());
  }

  Future<Either<FailureErr, WeatherEntity>> _getWeather(Future<WeatherModel> Function() chooser) async {
    if (await info.isConnection) {
      try {
        final weather = await chooser();
        return Right(weather);
      } on ServerException {
        return Left(ServerFailureErr(message: 'There is a problem with server'));
      }
    } else {
      return Left(InternetFailureErr(message: 'Internet connection not available'));
    }
  }
}
