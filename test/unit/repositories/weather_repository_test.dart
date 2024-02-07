import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/api/models/weather_response.dart';
import 'package:flutter_weather_app/api/repositories/weather_repository.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.dart';
import '../../mocks/weather_response.mock.dart';

void main() {
  late WeatherRepository weatherRepository;
  late MockWeatherClient mockWeatherClient;

  setUp(() {
    mockWeatherClient = MockWeatherClient();
    weatherRepository = WeatherRepository(weatherClient: mockWeatherClient);
  });

  group('getWeather', () {
    test('returns a reversed WeatherResponse when the call completes successfully', () async {
      final mockWeatherResponse = weatherResponseMock();
      when(mockWeatherClient.getWeather()).thenAnswer((_) async => mockWeatherResponse);

      expect(
        await weatherRepository.getWeather(),
        equals(
          mockWeatherResponse.copyWith(
            daily: Daily(
              time: mockWeatherResponse.daily.time.reversed.toList(),
              weatherCode: mockWeatherResponse.daily.weatherCode.reversed.toList(),
              temperature2mMax: mockWeatherResponse.daily.temperature2mMax.reversed.toList(),
              temperature2mMin: mockWeatherResponse.daily.temperature2mMin.reversed.toList(),
              sunrise: mockWeatherResponse.daily.sunrise.reversed.toList(),
              sunset: mockWeatherResponse.daily.sunset.reversed.toList(),
              uvIndexMax: mockWeatherResponse.daily.uvIndexMax.reversed.toList(),
            ),
          ),
        ),
      );
    });

    test('throws an exception when the call completes with an error', () async {
      when(mockWeatherClient.getWeather()).thenThrow(Exception('Failed to fetch weather'));

      expect(weatherRepository.getWeather(), throwsException);
    });
  });
}
