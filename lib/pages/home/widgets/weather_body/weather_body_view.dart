import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_body/weather_info_item_view.dart';
import 'package:intl/intl.dart';

class WeatherBodyView extends StatelessWidget {
  const WeatherBodyView({required this.index, required this.weatherState, super.key});
  final int index;
  final WeatherLoaded weatherState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final daily = weatherState.weatherResponse.daily;
    final dailyUnits = weatherState.weatherResponse.dailyUnits;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: theme.iconTheme.color,
              radius: 16,
              child: SvgPicture.asset(
                daily.weatherCode[index].toAsset(),
                width: theme.iconTheme.size,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      daily.weatherCode[index].toTitle(),
                      style: theme.textTheme.titleMedium,
                    ),
                    Text('UV ${daily.uvIndexMax[index]}'),
                    const SizedBox(height: 12),
                    WeatherInfoItemView(
                      title: 'High',
                      description: '${daily.temperature2mMax[index]}${dailyUnits.temperature2mMax}',
                      assetName: AppConstants.temperatureHigh,
                    ),
                    WeatherInfoItemView(
                      title: 'Low',
                      description: '${daily.temperature2mMin[index]}${dailyUnits.temperature2mMin}',
                      assetName: AppConstants.temperatureLow,
                    ),
                    WeatherInfoItemView(
                      title: 'Sunrise',
                      description: DateFormat.Hm().format(DateTime.parse(daily.sunrise[index])),
                      assetName: AppConstants.sun,
                    ),
                    WeatherInfoItemView(
                      title: 'Sunset',
                      description: DateFormat.Hm().format(DateTime.parse(daily.sunset[index])),
                      assetName: AppConstants.moon,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(daily.time[index].replaceAll('-', '/'), style: const TextStyle(fontStyle: FontStyle.italic)),
                Expanded(
                  child: SvgPicture.asset(
                    AppConstants.forwardRight,
                    width: Theme.of(context).iconTheme.size,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
