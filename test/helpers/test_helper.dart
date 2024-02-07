import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/api/repositories/weather_client.dart';
import 'package:flutter_weather_app/api/repositories/weather_repository.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

export 'test_helper.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<WeatherBloc>(),
    MockSpec<ThemeBloc>(),
    MockSpec<WeatherRepository>(),
    MockSpec<WeatherClient>(),
    MockSpec<AssetBundle>(),
    MockSpec<http.Client>(),
  ],
)
class TestHelper {
  static Widget buildTestWidget({
    required Widget child,
    List<BlocProvider>? providers,
  }) {
    if (providers?.isNotEmpty ?? false) {
      return MultiBlocProvider(
        providers: providers ?? [],
        child: MaterialApp(
          home: Scaffold(
            body: child,
          ),
        ),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
          body: child,
        ),
      );
    }
  }
}
