import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/api/models/weather_response.dart';
import 'package:flutter_weather_app/api/repositories/weather_repository.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      switch (event) {
        case FetchWeather():
          await _mapFetchWeatherToState(emit);
      }
    });
  }

  Future<void> _mapFetchWeatherToState(Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherResponse = await weatherRepository.getWeather();
      emit(WeatherLoaded(weatherResponse: weatherResponse));
    } catch (e) {
      emit(WeatherFailure(errorMessage: e.toString()));
    }
  }

  final WeatherRepository weatherRepository;
}

extension WeatherCodeExtension on int {
  String toAsset() {
    switch (this) {
      case 0:
        return AppConstants.sun;
      case 1:
      case 2:
      case 3:
        return AppConstants.cloud;
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 85:
      case 86:
      case 95:
      case 96:
      case 99:
        return AppConstants.weatherRain;
      default:
        return AppConstants.error;
    }
  }

  String toTitle() {
    switch (this) {
      case 0:
        return 'Sunny';
      case 1:
      case 2:
      case 3:
        return 'Cloudy';
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 85:
      case 86:
      case 95:
      case 96:
      case 99:
        return 'Rainy';
      default:
        return 'Unknown';
    }
  }
}
