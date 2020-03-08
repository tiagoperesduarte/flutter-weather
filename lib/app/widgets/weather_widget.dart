import 'package:flutter/material.dart';
import 'package:flutterweather/app/models/weather.dart';
import 'package:flutterweather/app/utils/string_utils.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                bottom: 16,
              ),
              child: Center(
                child: Text(
                  '${weather.currentTemp.toStringAsFixed(0)}°',
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: Center(
                child: Text(
                  weather.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 4,
              ),
              child: Center(
                child: Text(
                  '${StringUtils.capitalize(DateFormat('EEEE').format(weather.date))} ⋅ ${weather.cityName}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'High: ${weather.maxTemp.toStringAsFixed(0)}° Low: ${weather.minTemp.toStringAsFixed(0)}° ⋅ Humidity: ${weather.humidity.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: Text(
                  'openweathermap.org',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
