import 'package:flutterweather/app/models/weather.dart';
import 'package:flutterweather/app/services/weather_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final WeatherService _weatherService;

  _HomeControllerBase(this._weatherService);

  Future<Weather> getCurrentWeather() async {
    return await _weatherService.getCurrentWeather();
  }
}
