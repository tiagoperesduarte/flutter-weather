class Weather {
  DateTime date;
  String cityName;
  String title;
  String description;
  double currentTemp;
  double minTemp;
  double maxTemp;
  double humidity;
  String imageUrl;

  Weather({
    this.date,
    this.cityName,
    this.title,
    this.description,
    this.currentTemp,
    this.minTemp,
    this.maxTemp,
    this.humidity,
    this.imageUrl,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    date = DateTime.fromMicrosecondsSinceEpoch(json['dt']);
    cityName = json['name'];
    title = json['weather'][0]['main'];
    description = json['weather'][0]['description'];
    currentTemp = double.parse(json['main']['temp'].toString());
    minTemp = double.parse(json['main']['temp_min'].toString());
    maxTemp = double.parse(json['main']['temp_max'].toString());
    humidity = double.parse(json['main']['humidity'].toString());

    String icon = json['weather'][0]['icon'];
    imageUrl = 'http://openweathermap.org/img/wn/$icon@2x.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['date'] = this.date;
    data['cityName'] = this.cityName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['currentTemp'] = this.currentTemp;
    data['minTemp'] = this.minTemp;
    data['maxTemp'] = this.maxTemp;
    data['humidity'] = this.humidity;
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}
