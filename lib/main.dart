import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/api/repositories/weather_client.dart';
import 'package:flutter_weather_app/api/repositories/weather_repository.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/pages/home/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: re-think about having a BlocProviderWrapper
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            assetBundle: DefaultAssetBundle.of(context),
          )..add(ReadThemeFromAsset()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            weatherRepository: WeatherRepository(
              weatherClient: WeatherClient(httpClient: http.Client()),
            ),
          )..add(FetchWeather()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            title: AppConstants.appTitle,
            theme: themeState,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
