import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';

void main() {
  test('WeatherCodeExtension returns correct asset and title', () {
    expect(0.toAsset(), AppConstants.sun);
    expect(0.toTitle(), 'Sunny');

    for (final code in [1, 2, 3]) {
      expect(code.toAsset(), AppConstants.cloud);
      expect(code.toTitle(), 'Cloudy');
    }

    for (final code in [61, 63, 65, 66, 67, 80, 81, 82, 85, 86, 95, 96, 99]) {
      expect(code.toAsset(), AppConstants.weatherRain);
      expect(code.toTitle(), 'Rainy');
    }
    expect(100.toAsset(), AppConstants.error);
    expect(100.toTitle(), 'Unknown');
  });
}
