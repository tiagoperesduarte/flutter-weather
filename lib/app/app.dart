import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterweather/app/pages/home_controller.dart';
import 'package:flutterweather/app/pages/home_page.dart';
import 'package:flutterweather/app/repositories/open_weather_map_repository.dart';
import 'package:flutterweather/app/repositories/weather_repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => Dio()),
        ProxyProvider<Dio, WeatherRepository>(update: (_, dio, __) => OpenWeatherMapRepository(dio)),
        ProxyProvider<WeatherRepository, HomeController>(update: (_, weatherRepository, __) => HomeController(weatherRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
