import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/service/weather_service.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('765c93ca40b501f5a712e94028b89d42');
  Weather? _weather;

  void _fetchWeather() async {
    var position = await _weatherService.getCurrentLocation();
    try {
      // Get current location
      // Get weather using latitude and longitude
      final weather = await _weatherService.getWeather(
          position.latitude, position.longitude);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'sunny.json'; // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'cloudy.json';
      case 'mist':
        return 'cloudy.json';
      case 'smoke':
        return 'cloudy.json';
      case 'haze':
        return 'cloudy.json';
      case 'dust':
        return 'cloudy.json';
      case 'fog':
        return 'cloudy.json';
      case 'rain':
        return 'cloudy.json';
      case 'drizzle':
        return 'cloudy.json';
      case 'shower rain':
        return 'cloudy.json';
      case 'thunderstorm':
        return 'cloudy.json';
      case 'clear':
        return 'sunny.json';
      default:
        return 'sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text('Temperatur: ${_weather?.temperature.round()}*C'),
            Text(_weather?.mainCondition ?? ''),
            Text(''),
            Text('Vindhastighed: ${_weather?.windSpeed.round() ?? ''} m/s'),
            Text('Tryk: ${_weather?.pressure.round() ?? ''} hPA'),
            Text('Luftfugtighed: ${_weather?.humidity.round() ?? ''}%'),
            Text('Vejrbeskrivelse: ${_weather?.weatherDescription}'),
          ],
        ),
      ),
    );
  }
}
