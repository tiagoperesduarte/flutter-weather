import 'package:flutter/material.dart';
import 'package:flutterweather/app/pages/home_controller.dart';
import 'package:flutterweather/app/widgets/weather_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: homeController.getCurrentWeather(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return Text('The app doesn\'t have access to the device\'s location');
              }

              return WeatherWidget(
                weather: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }
}
