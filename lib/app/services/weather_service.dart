import 'package:flutterweather/app/models/weather.dart';
import 'package:flutterweather/app/repositories/weather_repository.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  final WeatherRepository _weatherRepository;
  final Geolocator _geolocator;

  WeatherService(this._weatherRepository, this._geolocator);

  Future<Weather> getCurrentWeather() async {
    var currentPosition = await _geolocator.getCurrentPosition();

    if (currentPosition == null) {
      return null;
    }

    return await _weatherRepository.getCurrentWeatherByLatitudeAndLongitude(currentPosition.latitude, currentPosition.longitude);
  }
}
