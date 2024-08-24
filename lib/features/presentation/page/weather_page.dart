import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/features/presentation/bloc/weather_bloc.dart';
import 'package:test_weather_app/features/presentation/widget/hourly_weather.dart';

import '../widget/current_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return _refresh();
          },
          child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
            children: [
              CurrentWeatherWidget(),
              const HourlyWeatherWidget(),
            ],
          )),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future(() =>
        BlocProvider.of<WeatherBloc>(context).add(GetWeatherByLocationEvent()));
  }
}
