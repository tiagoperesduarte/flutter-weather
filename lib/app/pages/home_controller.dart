import 'package:flutterweather/app/models/weather.dart';
import 'package:flutterweather/app/repositories/weather_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final WeatherRepository weatherRepository;

  _HomeControllerBase(this.weatherRepository);

  Future<Weather> getCurrentWeather() async {
    return await weatherRepository.getCurrentWeatherByLatitudeAndLongitude(-18.9113, -48.2622);
  }
}
