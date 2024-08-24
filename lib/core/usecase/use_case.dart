import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_weather_app/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<FailureErr, Type>> call(Params params);
}

class CityParams extends Equatable {
  final String cityName;

  const CityParams({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
