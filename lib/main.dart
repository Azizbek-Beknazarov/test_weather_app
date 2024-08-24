import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/features/presentation/bloc/weather_bloc.dart';
import 'package:test_weather_app/features/presentation/page/weather_page.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.blue)),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => sl<WeatherBloc>()..add(GetWeatherByLocationEvent()),
        child: WeatherPage(),
      ),
    );
  }
}

/// bloc logger
class LogBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("\n----------$bloc Changed-----------\n\n");
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("-------$bloc closed--------------\n\n");
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print("------$bloc created---------------\n\n");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('---------Event------------${bloc.runtimeType} $event\n\n');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('---------Error------------${bloc.runtimeType} $error\n\n');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print("--------------$bloc Transition---------------------\n\n");
    }
  }
}
