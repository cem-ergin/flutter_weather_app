import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/api/repositories/weather_repository.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.dart';
import '../../../mocks/weather_response.mock.dart';

void main() {
  late WeatherRepository weatherRepository;

  setUpAll(() {
    weatherRepository = MockWeatherRepository();
    when(weatherRepository.getWeather()).thenAnswer((_) async => weatherResponseMock());
  });

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherLoaded] when FetchWeather is added.',
    build: () => WeatherBloc(weatherRepository: weatherRepository),
    act: (bloc) => bloc.add(FetchWeather()),
    expect: () => [
      WeatherLoading(),
      isA<WeatherLoaded>(),
    ],
  );

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherFailure] when FetchWeather throws error.',
    build: () => WeatherBloc(weatherRepository: weatherRepository),
    act: (bloc) {
      when(weatherRepository.getWeather()).thenThrow(Exception('Error getting weather'));
      bloc.add(FetchWeather());
    },
    expect: () => [
      WeatherLoading(),
      WeatherFailure(errorMessage: 'Exception: Error getting weather'),
    ],
  );
}
