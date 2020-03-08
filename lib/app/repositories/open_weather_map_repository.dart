import 'package:dio/dio.dart';
import 'package:flutterweather/app/config/env.dart';
import 'package:flutterweather/app/exceptions/service_unavailable_exception.dart';
import 'package:flutterweather/app/models/weather.dart';
import 'package:flutterweather/app/repositories/weather_repository.dart';

class OpenWeatherMapRepository implements WeatherRepository {
  final Dio dio;

  OpenWeatherMapRepository(this.dio);

  @override
  Future<Weather> getCurrentWeatherByLatitudeAndLongitude(double latitude, double longitude) async {
    String url = await _getUrl(latitude, longitude);
    Response response = await dio.get(url);

    if (response.statusCode != 200) {
      throw ServiceUnavailableException('There was a problem communicating with OpenWeatherMap. Try again later.');
    }

    return Weather.fromJson(response.data);
  }

  Future<String> _getUrl(double latitude, double longitude) async {
    String apiUrl = await Env.get('api_url');
    String accessKey = await Env.get('access_key');

    return '$apiUrl?lat=$latitude&lon=$longitude&units=metric&lang=pt_br&appid=$accessKey';
  }
}
