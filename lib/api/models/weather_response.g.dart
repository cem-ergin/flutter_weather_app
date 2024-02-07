// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherResponseCWProxy {
  WeatherResponse dailyUnits(DailyUnits dailyUnits);

  WeatherResponse daily(Daily daily);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherResponse call({
    DailyUnits? dailyUnits,
    Daily? daily,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherResponse.copyWith.fieldName(...)`
class _$WeatherResponseCWProxyImpl implements _$WeatherResponseCWProxy {
  const _$WeatherResponseCWProxyImpl(this._value);

  final WeatherResponse _value;

  @override
  WeatherResponse dailyUnits(DailyUnits dailyUnits) =>
      this(dailyUnits: dailyUnits);

  @override
  WeatherResponse daily(Daily daily) => this(daily: daily);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherResponse call({
    Object? dailyUnits = const $CopyWithPlaceholder(),
    Object? daily = const $CopyWithPlaceholder(),
  }) {
    return WeatherResponse(
      dailyUnits:
          dailyUnits == const $CopyWithPlaceholder() || dailyUnits == null
              ? _value.dailyUnits
              // ignore: cast_nullable_to_non_nullable
              : dailyUnits as DailyUnits,
      daily: daily == const $CopyWithPlaceholder() || daily == null
          ? _value.daily
          // ignore: cast_nullable_to_non_nullable
          : daily as Daily,
    );
  }
}

extension $WeatherResponseCopyWith on WeatherResponse {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherResponse.copyWith(...)` or like so:`instanceOfWeatherResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherResponseCWProxy get copyWith => _$WeatherResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      dailyUnits:
          DailyUnits.fromJson(json['daily_units'] as Map<String, dynamic>),
      daily: Daily.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'daily_units': instance.dailyUnits,
      'daily': instance.daily,
    };

DailyUnits _$DailyUnitsFromJson(Map<String, dynamic> json) => DailyUnits(
      time: json['time'] as String,
      weatherCode: json['weather_code'] as String,
      temperature2mMax: json['temperature_2m_max'] as String,
      temperature2mMin: json['temperature_2m_min'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
    );

Map<String, dynamic> _$DailyUnitsToJson(DailyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weather_code': instance.weatherCode,
      'temperature_2m_max': instance.temperature2mMax,
      'temperature_2m_min': instance.temperature2mMin,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      weatherCode:
          (json['weather_code'] as List<dynamic>).map((e) => e as int).toList(),
      temperature2mMax: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      sunrise:
          (json['sunrise'] as List<dynamic>).map((e) => e as String).toList(),
      sunset:
          (json['sunset'] as List<dynamic>).map((e) => e as String).toList(),
      uvIndexMax: (json['uv_index_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'time': instance.time,
      'weather_code': instance.weatherCode,
      'temperature_2m_max': instance.temperature2mMax,
      'temperature_2m_min': instance.temperature2mMin,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'uv_index_max': instance.uvIndexMax,
    };
