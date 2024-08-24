import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:test_weather_app/core/error/exception.dart';
import 'package:test_weather_app/core/util/constants.dart' as con;
import 'package:test_weather_app/features/data/model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherCityNameDatasourse(String cityName);

  Future<WeatherModel> getWeatherLocationDatasourse();
}

//

class WeatherRemoteDataSourceImple implements WeatherRemoteDataSource {
  http.Client client;
  Geolocator geolocator;

  WeatherRemoteDataSourceImple({required this.client, required this.geolocator});

  @override
  Future<WeatherModel> getWeatherCityNameDatasourse(String shaharNomi) async {
    String link = '${con.Constants.weatherUrl}q=$shaharNomi&appid=${con.Constants.apiKey}${con.Constants.units}';
    final response = await client.get(Uri.parse(link), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<WeatherModel> getWeatherLocationDatasourse() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw LocationDisabledException();
    }
    //
    Position position = await Geolocator.getCurrentPosition();
//
    double lon = position.longitude;
    double lat = position.latitude;
//
    String link = '${con.Constants.weatherUrl}lat=$lat&lon=$lon&appid=${con.Constants.apiKey}${con.Constants.units}';
    //
    final response = await client.get(
        Uri.parse(
          link,
        ),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
