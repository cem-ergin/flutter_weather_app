// ignore_for_file: depend_on_referenced_packages

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@CopyWith()
@JsonSerializable()
class WeatherResponse extends Equatable {
  const WeatherResponse({
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  @JsonKey(name: 'daily_units')
  final DailyUnits dailyUnits;
  final Daily daily;

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  List<Object?> get props => [daily, dailyUnits];
}

@JsonSerializable()
class DailyUnits extends Equatable {
  const DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => _$DailyUnitsFromJson(json);
  final String time;
  @JsonKey(name: 'weather_code')
  final String weatherCode;
  @JsonKey(name: 'temperature_2m_max')
  final String temperature2mMax;
  @JsonKey(name: 'temperature_2m_min')
  final String temperature2mMin;
  final String sunrise;
  final String sunset;

  Map<String, dynamic> toJson() => _$DailyUnitsToJson(this);

  @override
  List<Object?> get props => [time, weatherCode, temperature2mMax, temperature2mMin, sunrise, sunset];
}

@JsonSerializable()
class Daily extends Equatable {
  const Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
  final List<String> time;
  @JsonKey(name: 'weather_code')
  final List<int> weatherCode;
  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperature2mMax;
  @JsonKey(name: 'temperature_2m_min')
  final List<double> temperature2mMin;
  final List<String> sunrise;
  final List<String> sunset;
  @JsonKey(name: 'uv_index_max')
  final List<double> uvIndexMax;

  Map<String, dynamic> toJson() => _$DailyToJson(this);

  @override
  List<Object?> get props => [time, weatherCode, temperature2mMax, temperature2mMin, sunrise, sunset, uvIndexMax];
}
