import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterweather/app/pages/home_controller.dart';
import 'package:flutterweather/app/pages/home_page.dart';
import 'package:flutterweather/app/repositories/open_weather_map_repository.dart';
import 'package:flutterweather/app/repositories/weather_repository.dart';
import 'package:flutterweather/app/services/weather_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => Dio()),
        Provider<Geolocator>(create: (_) => Geolocator()),
        ProxyProvider<Dio, WeatherRepository>(update: (_, dio, __) => OpenWeatherMapRepository(dio)),
        ProxyProvider2<WeatherRepository, Geolocator, WeatherService>(update: (_, weatherRepository, geolocator, __) => WeatherService(weatherRepository, geolocator)),
        ProxyProvider<WeatherService, HomeController>(update: (_, weatherService, __) => HomeController(weatherService)),
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
