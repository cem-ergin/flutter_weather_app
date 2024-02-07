import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_loaded_view.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.dart';
import '../../../../mocks/weather_response.mock.dart';

void main() {
  late WeatherBloc weatherBloc;

  setUpAll(() {
    weatherBloc = MockWeatherBloc();
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      TestHelper.buildTestWidget(
        child: const WeatherLoadedView(),
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => weatherBloc,
          ),
        ],
      ),
    );
  }

  testWidgets('renders WeatherLoadedView when state is WeatherLoaded', (WidgetTester tester) async {
    when(weatherBloc.state).thenReturn(WeatherLoaded(weatherResponse: weatherResponseMock()));
    await pumpWidget(tester);

    expect(find.byType(WeatherLoadedView), findsOneWidget);
  });

  testWidgets('renders CircularProgressIndicator when state is not WeatherLoaded', (WidgetTester tester) async {
    when(weatherBloc.state).thenReturn(WeatherInitial());
    await pumpWidget(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders 10 elements in list view when weather response has 10 elements', (WidgetTester tester) async {
    when(weatherBloc.state).thenReturn(WeatherLoaded(weatherResponse: weatherResponseMock()));
    await pumpWidget(tester);
    expect((tester.widget(find.byType(ListView)) as ListView).semanticChildCount, 10);
  });
}
