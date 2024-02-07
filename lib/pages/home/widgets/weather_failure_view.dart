import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';

class WeatherFailureView extends StatelessWidget {
  const WeatherFailureView({required this.error, super.key});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherBloc>().add(FetchWeather());
              },
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
