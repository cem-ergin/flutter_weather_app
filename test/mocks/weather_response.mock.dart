import 'package:flutter_weather_app/api/models/weather_response.dart';

WeatherResponse weatherResponseMock({int? weatherCode}) {
  return WeatherResponse(
    dailyUnits: DailyUnits(
      time: 'timeUnit',
      weatherCode: 'weatherCodeUnit',
      temperature2mMax: 'tempMaxUnit',
      temperature2mMin: 'tempMinUnit',
      sunrise: 'sunriseUnit',
      sunset: 'sunsetUnit',
    ),
    daily: Daily(
      time: [
        '2024-02-12',
        '2024-02-11',
        '2024-02-10',
        '2024-02-9',
        '2024-02-8',
        '2024-02-7',
        '2024-02-6',
        '2024-02-5',
        '2024-02-4',
        '2024-02-3',
      ],
      weatherCode: [weatherCode ?? 95, 61, 61, 63, 53, 3, 3, 3, 3, 3],
      temperature2mMax: [15, 13, 10, 12, 14, 15, 16, 17, 18, 19],
      temperature2mMin: [10, 8, 5, 7, 9, 10, 11, 12, 13, 14],
      sunrise: [
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
        "2024-02-12T07:22",
      ],
      sunset: [
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
        "2024-02-12T07:32",
      ],
      uvIndexMax: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    ),
  );
}

final Map<String, dynamic> weatherJsonResponseMock = {
  "latitude": 40.89,
  "longitude": -8.610001,
  "generationtime_ms": 0.2790689468383789,
  "utc_offset_seconds": 0,
  "timezone": "GMT",
  "timezone_abbreviation": "GMT",
  "elevation": 40.0,
  "daily_units": {
    "time": "iso8601",
    "weather_code": "wmo code",
    "temperature_2m_max": "°C",
    "temperature_2m_min": "°C",
    "sunrise": "iso8601",
    "sunset": "iso8601",
    "uv_index_max": ""
  },
  "daily": {
    "time": [
      "2024-02-04",
      "2024-02-05",
      "2024-02-06",
      "2024-02-07",
      "2024-02-08",
      "2024-02-09",
      "2024-02-10",
      "2024-02-11",
      "2024-02-12",
      "2024-02-13"
    ],
    "weather_code": [3, 3, 3, 3, 3, 63, 61, 80, 80, 95],
    "temperature_2m_max": [19.1, 17.4, 16.4, 18.3, 15.9, 16.0, 11.2, 14.9, 16.7, 16.4],
    "temperature_2m_min": [7.5, 6.6, 6.6, 11.0, 14.1, 11.0, 9.6, 7.5, 12.5, 14.2],
    "sunrise": [
      "2024-02-04T07:42",
      "2024-02-05T07:41",
      "2024-02-06T07:40",
      "2024-02-07T07:38",
      "2024-02-08T07:37",
      "2024-02-09T07:36",
      "2024-02-10T07:35",
      "2024-02-11T07:34",
      "2024-02-12T07:32",
      "2024-02-13T07:31"
    ],
    "sunset": [
      "2024-02-04T17:54",
      "2024-02-05T17:55",
      "2024-02-06T17:56",
      "2024-02-07T17:58",
      "2024-02-08T17:59",
      "2024-02-09T18:00",
      "2024-02-10T18:01",
      "2024-02-11T18:03",
      "2024-02-12T18:04",
      "2024-02-13T18:05"
    ],
    "uv_index_max": [3.35, 3.00, 3.55, 3.50, 0.20, 3.00, 3.40, 3.05, 3.20, 3.50]
  }
};
