import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_body/weather_body_view.dart';

class WeatherLoadedView extends StatelessWidget {
  const WeatherLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (_, state) {
        if (state is! WeatherLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () {
            context.read<WeatherBloc>().add(FetchWeather());
            return Future.value();
          },
          child: ListView.separated(
            separatorBuilder: (_, index) => const Divider(),
            itemCount: state.weatherResponse.daily.time.length,
            itemBuilder: (_, index) {
              return WeatherBodyView(
                index: index,
                weatherState: state,
              );
            },
          ),
        );
      },
    );
  }
}
