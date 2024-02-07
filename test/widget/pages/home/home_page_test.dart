import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/pages/home/home_page.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_loaded_view.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.dart';
import '../../../mocks/weather_response.mock.dart';

void main() {
  late WeatherBloc weatherBloc;

  setUpAll(() {
    weatherBloc = MockWeatherBloc();
    when(weatherBloc.state).thenReturn(WeatherInitial());
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      TestHelper.buildTestWidget(
        child: const HomePage(),
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => weatherBloc,
          ),
        ],
      ),
    );
  }

  testWidgets('renders HomePage intially', (WidgetTester tester) async {
    await pumpWidget(tester);

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('renders CircularProgressIndicator when state is WeatherLoading', (WidgetTester tester) async {
    when(weatherBloc.state).thenReturn(WeatherLoading());
    await pumpWidget(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders WeatherLoadedView when state is WeatherLoaded', (WidgetTester tester) async {
    when(weatherBloc.state).thenReturn(WeatherLoaded(weatherResponse: weatherResponseMock()));
    await pumpWidget(tester);

    expect(find.byType(WeatherLoadedView), findsOneWidget);
  });

  testWidgets('renders error view when state is WeatherFailure', (WidgetTester tester) async {
    const errorMessage = 'errorMessage';
    when(weatherBloc.state).thenReturn(WeatherFailure(errorMessage: errorMessage));

    await pumpWidget(tester);

    expect(find.text(errorMessage), findsOneWidget);
  });
}
