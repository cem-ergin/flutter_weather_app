import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_failure_view.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_loaded_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Weather',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: false,
      ),
      drawer: const Drawer(
        child: Center(child: Text('This drawer is here just because it is in the provided design')),
      ),
      body: Column(
        children: [
          Image.asset(AppConstants.band),
          Expanded(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (_, state) {
                switch (state) {
                  case WeatherInitial():
                  case WeatherLoading():
                    return const Center(child: CircularProgressIndicator());
                  case WeatherLoaded():
                    return const WeatherLoadedView();
                  case WeatherFailure():
                    return WeatherFailureView(
                      error: state.errorMessage,
                    );

                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
