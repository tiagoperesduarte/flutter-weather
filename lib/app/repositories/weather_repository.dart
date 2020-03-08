import 'package:flutterweather/app/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeatherByLatitudeAndLongitude(double latitude, double longitude);
}
