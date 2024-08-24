import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_weather_app/features/data/datasource/weather_remote_datasource.dart';
import 'package:test_weather_app/features/data/repository/weather_repo_impl.dart';
import 'package:test_weather_app/features/domain/repository/weather_repo.dart';
import 'package:test_weather_app/features/domain/usecase/get_weather_location.dart';
import 'package:test_weather_app/features/domain/usecase/get_weather_city_name.dart';
import 'package:test_weather_app/features/presentation/bloc/weather_bloc.dart';

import 'core/network/network_info.dart';
import 'core/util/input_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - weather
  //bloc
  sl.registerFactory(() => WeatherBloc(
      inputChecker: sl(),
      getWeatherByCityName: sl(),
      getWeatherDataByLocation: sl()));
  //Use Cases
  sl.registerLazySingleton(() => GetWeatherByCityName(sl()));
  sl.registerLazySingleton(() => GetWeatherDataByLocation(sl()));
  // Repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImple(
        remoteDataSource: sl(),
        info: sl(),
        // localDatasource: sl(),
      ));
  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImple(
            client: sl(),
            geolocator: sl(),
          ));

  //! core
  sl.registerLazySingleton(() => InputChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImple(checker: sl()));
  //! External

  //geoLocator
  sl.registerLazySingleton(() => Geolocator());
  // Client
  sl.registerLazySingleton(() => http.Client());
  // ConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
