import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app/api/models/weather_response.dart';
import 'package:flutter_weather_app/api/repositories/weather_client.dart';

import '../../helpers/test_helper.dart';
import '../../mocks/weather_response.mock.dart';

void main() {
  late WeatherClient weatherClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    weatherClient = WeatherClient(httpClient: mockHttpClient);
  });

  group('getWeather', () {
    test('returns a WeatherResponse when the call completes successfully', () async {
      final mockWeatherResponseJson = jsonEncode(weatherJsonResponseMock);

      when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(mockWeatherResponseJson, 200));

      final result = await weatherClient.getWeather();
      expect(result, isInstanceOf<WeatherResponse>());
    });

    test('throws an exception when the call completes with an error', () async {
      when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() async => weatherClient.getWeather(), throwsException);
    });
  });
}
