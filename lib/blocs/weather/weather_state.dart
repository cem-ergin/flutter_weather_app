part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  WeatherLoaded({required this.weatherResponse});
  final WeatherResponse weatherResponse;

  @override
  List<Object?> get props => [weatherResponse];
}

final class WeatherFailure extends WeatherState {
  WeatherFailure({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
