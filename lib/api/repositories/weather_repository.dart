import 'package:flutter_weather_app/api/models/weather_response.dart';
import 'package:flutter_weather_app/api/repositories/weather_client.dart';

class WeatherRepository {
  WeatherRepository({required this.weatherClient});
  final WeatherClient weatherClient;

  Future<WeatherResponse> getWeather() async {
    final weatherResponse = await weatherClient.getWeather();
    // I couldn't find any way to sort the data from the API, so I had to do it manually
    final sortedWeatherResponse = weatherResponse.copyWith.call(
      daily: Daily(
        time: weatherResponse.daily.time.reversed.toList(),
        weatherCode: weatherResponse.daily.weatherCode.reversed.toList(),
        temperature2mMax: weatherResponse.daily.temperature2mMax.reversed.toList(),
        temperature2mMin: weatherResponse.daily.temperature2mMin.reversed.toList(),
        sunrise: weatherResponse.daily.sunrise.reversed.toList(),
        sunset: weatherResponse.daily.sunset.reversed.toList(),
        uvIndexMax: weatherResponse.daily.uvIndexMax.reversed.toList(),
      ),
    );

    return sortedWeatherResponse;
  }
}
