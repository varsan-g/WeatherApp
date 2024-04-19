class Weather {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double pressure;
  final String mainCondition;
  final String weatherDescription;

  Weather({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.mainCondition,
    required this.weatherDescription,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['current']['temp'].toDouble(),
      windSpeed: json['current']['wind_speed'].toDouble(),
      humidity: json['current']['humidity'].toDouble(),
      pressure: json['current']['pressure'].toDouble(),
      mainCondition: json['current']['weather'][0]['main'],
      weatherDescription: json['current']['weather'][0]['description'],
    );
  }
}
