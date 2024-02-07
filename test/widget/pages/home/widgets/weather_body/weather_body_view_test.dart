import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_body/weather_body_view.dart';

import '../../../../../helpers/test_helper.dart';
import '../../../../../mocks/weather_response.mock.dart';

void main() {
  Future<void> pumpWidget(WidgetTester tester, {int? weatherCode}) async {
    await tester.pumpWidget(
      TestHelper.buildTestWidget(
        child: ListView(
          children: [
            WeatherBodyView(
              index: 0,
              weatherState: WeatherLoaded(
                weatherResponse: weatherResponseMock(weatherCode: weatherCode),
              ),
            ),
          ],
        ),
      ),
    );
  }

  testWidgets('renders Sunny weather title when weatherCode is 0', (WidgetTester tester) async {
    await pumpWidget(tester, weatherCode: 0);
    expect(find.text('Sunny'), findsOneWidget);
  });

  testWidgets('renders Sunny weather title when weatherCode is 1', (WidgetTester tester) async {
    await pumpWidget(tester, weatherCode: 1);
    expect(find.text('Cloudy'), findsOneWidget);
  });

  testWidgets('renders Rainy weather title when weatherCode is 61', (WidgetTester tester) async {
    await pumpWidget(tester, weatherCode: 61);
    expect(find.text('Rainy'), findsOneWidget);
  });

  testWidgets('renders Rainy weather title when weatherCode is -1', (WidgetTester tester) async {
    await pumpWidget(tester, weatherCode: -1);
    expect(find.text('Unknown'), findsOneWidget);
  });
}
