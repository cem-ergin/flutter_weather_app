import 'dart:convert';

import 'package:flutter_weather_app/api/models/weather_response.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'https://api.open-meteo.com/v1';

class WeatherClient {
  WeatherClient({
    required this.httpClient,
  });

  final http.Client httpClient;

  Future<WeatherResponse> getWeather({
    double? latitude = 40.89,
    double? longitude = -8.615,
    int? pastDays = 3,
    int? forecastDays = 7,
  }) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max&past_days=$pastDays&forecast_days=$forecastDays',
      );
      final response = await httpClient.get(url);

      if (response.statusCode != 200) {
        throw Exception('Error getting weather');
      }

      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
