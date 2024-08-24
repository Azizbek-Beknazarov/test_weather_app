import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/core/error/failure.dart';
import 'package:test_weather_app/core/usecase/use_case.dart';
import 'package:test_weather_app/core/util/constants.dart' as constants;
import 'package:test_weather_app/features/domain/usecase/get_weather_location.dart';

import '../../../core/util/input_checker.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/usecase/get_weather_city_name.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByCityName getWeatherByCityName;
  final GetWeatherDataByLocation getWeatherDataByLocation;
  final InputChecker inputChecker;

  WeatherBloc({
    required this.getWeatherByCityName,
    required this.getWeatherDataByLocation,
    required this.inputChecker,
  }) : super(InitialWeather()) {
    //1-event
    on<GetWeatherByCityNameEvent>((event, emit) async {
      //
      final Either inputEither = inputChecker.checkOfStringInput(event.cityName);
      //
      await inputEither.fold((err) async => emit(ErrorWeather(errorMessage: _mapFailureToMessage(err))), (city) async {
        emit(LoadingWeather());
        //
        final errOrWeather = await getWeatherByCityName(CityParams(cityName: city));
        errOrWeather.fold((l) => emit(ErrorWeather(errorMessage: _mapFailureToMessage(l))), (city) => emit(LoadedWeather(weather: city)));
      });
    });

    // 2-event
    on<GetWeatherByLocationEvent>((event, emit) async {
      emit(LoadingWeather());
      final errOrWeather = await getWeatherDataByLocation(NoParams());
      errOrWeather.fold((l) => emit(ErrorWeather(errorMessage: _mapFailureToMessage(l))), (city) => emit(LoadedWeather(weather: city)));
    });
  }

  String _mapFailureToMessage(FailureErr failure) {
    switch (failure.runtimeType) {
      case const (ServerFailureErr):
        return constants.Constants.SERVER_FAIL_MESSAGE;
      case const (InternetFailureErr):
        return constants.Constants.INTERNET_FAIL_MESSAGE;
      case const (InvalidInputFailureErr):
        return constants.Constants.INVALID_INPUT_FAIL_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
