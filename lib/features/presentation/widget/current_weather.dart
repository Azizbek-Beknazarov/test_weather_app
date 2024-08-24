import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app/features/presentation/bloc/weather_bloc.dart';
import 'package:test_weather_app/features/presentation/widget/extra_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  CurrentWeatherWidget({super.key});

  String cityName = '';
  final TextEditingController controllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff00A1FF),
      ),
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        String iconPath = 'images/sunny.png';

        if (state is LoadedWeather) {
          iconPath = _setIconPath(state.weather.icon);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(CupertinoIcons.search),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            Size size = MediaQuery.of(context).size;
                            return Scaffold(
                              body: SizedBox(
                                height: size.height - 250,
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
                                          hintText: 'Enter city name',
                                          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          searchShaharNomi(context, cityName);
                                        },
                                        controller: controllerCity,
                                        onChanged: (value) {
                                          cityName = value;
                                        },
                                        style: const TextStyle(color: Colors.black),
                                        cursorColor: Colors.blue,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            searchShaharNomi(context, cityName);
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
                                          child: const Text(
                                            'Search',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.map_fill, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        state.weather.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context).add(GetWeatherByLocationEvent());
                      },
                      icon: const Icon(
                        Icons.update,
                        color: Colors.white,
                      ))
                ],
              ),
              Text(
                state.weather.sys.country,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  children: [
                    Image.asset(
                      (iconPath),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              "${state.weather.main.temp.round().toString()}\u00B0",
                              style: const TextStyle(height: 0.1, fontSize: 150, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 60),
                            Text(state.weather.description,
                                style: const TextStyle(
                                  fontSize: 25,
                                )),
                            Text(
                              '${DateFormat.yMMMd().add_Hm().format(state.weather.date)} ',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )))
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              const ExtraWeatherWidget(),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator.adaptive(backgroundColor: Colors.black),
        );
      }),
    );
  }

  void searchShaharNomi(BuildContext context, String shahar) {
    controllerCity.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    BlocProvider.of<WeatherBloc>(context).add(GetWeatherByCityNameEvent(shahar));
  }

  String _setIconPath(String icon) {
    switch (icon) {
      case '01d':
        return 'images/clear_day.png';

      case '01n':
        return 'images/clear_night.png';

      case '02d':
        return 'images/few_clouds_d.png';

      case '02n':
        return 'images/few_clouds_n.png';

      case '03d':
        return 'images/scattered_clouds_d.png';

      case '03n':
        return 'images/scattered_clouds_n.png';

      case '04d':
        return 'images/broken_clouds.png';

      case '04n':
        return 'images/broken_clouds.png';

      case '09d':
        return 'images/shower_rain.png';

      case '09n':
        return 'images/shower_rain.png';

      case '10d':
        return 'images/shower_rain.png';

      case '10n':
        return 'images/shower_rain.png';

      case '11d':
        return 'images/thunderstorm.png';

      case '11n':
        return 'images/thunderstorm.png';

      case '13d':
        return 'images/snow2.png';
      case '13n':
        return 'images/snow2.png';

      case '50d':
        return 'images/mist.png';

      case '50n':
        return 'images/mist.png';

      default:
        return 'images/sunny.png';
    }
  }
}
