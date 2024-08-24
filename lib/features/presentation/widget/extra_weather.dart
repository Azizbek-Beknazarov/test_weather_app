import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/features/presentation/bloc/weather_bloc.dart';

class ExtraWeatherWidget extends StatelessWidget {
  const ExtraWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (ctx, state) {
      if (state is LoadedWeather) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Icon(
                  CupertinoIcons.wind,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${state.weather.windSpeed.round()} m/s",
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Wind",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Image(
                  image: AssetImage('images/humidity.png'),
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${state.weather.main.humidity.round()} %",
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Humadity",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${((state.weather.visibility) / 1000).round()} km",
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Visability",
                  style: TextStyle(color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                const Image(
                  image: AssetImage('images/icon_airpressure.png'),
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${state.weather.main.pressure.round()} hPa",
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Pressure",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
          ],
        );
      }
      return const Center(
        child: Text('error bloc builder'),
      );
    });
  }
}
